import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/model/CategoryModel.dart';
import 'package:sb_portal/ui/dashboard/model/ProductCategoryModel.dart';
import 'package:sb_portal/ui/dashboard/model/SliderModel.dart';
import 'package:sb_portal/ui/dashboard/model/SwipeWidgetModel.dart';
import 'package:sb_portal/ui/dashboard/model/WIthOutLoginProductListModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerSideMenu.dart';
import 'package:sb_portal/ui/dashboard/view/search/SearchProductScreen.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/CategoryNameScreen.dart';
import 'package:sb_portal/ui/helper/category_list.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  _BuyerHomeScreenState createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  ProductCategoryModel productCategoryModel = ProductCategoryModel();
  SliderModel sliderModel = SliderModel();
  WIthOutLoginProductListModel productListModel =
      WIthOutLoginProductListModel();
  Category? categoryData;
  HomeProvider? mHomeProvider;
  final TextEditingController _searchController = TextEditingController();
  List<SwipeWidgetModel> introWidgetsList = [];
  List<SwipeWidgetModel> introSliderList = [];
  final ValueNotifier<double> _notifier = ValueNotifier<double>(0);
  var currentPageValue = 0;
  int? _previousPage;
  var _pageController;
  int _pos = 0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      setState(() {
        _pos = (_pos + 1) % introSliderList.length;
      });
    });

    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    )..addListener(_onScroll);

    _previousPage = _pageController.initialPage;
    callProductCategoryListApi();
    callProductListApi();
    callSliderApi();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_pageController.page!.toInt() == _pageController.page) {
      _previousPage = _pageController.page!.toInt();
    }
    _notifier.value = (_pageController.page! - _previousPage!);
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          drawer: const BuyerSideMenu(),
          body: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          // productCategoryModel.results != null
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //           decoration: BoxDecoration(
          //             color: AppColors.colorWhite,
          //             border: Border.all(color: AppColors.colorBorder, width: 1.0),
          //             borderRadius: const BorderRadius.all(Radius.circular(6)),
          //           ),
          //           child: DropdownButton<Category>(
          //             hint: categoryData == null ? const Text('Select Category') : Text(categoryData!.categoryName!),
          //             underline: Container(),
          //             isExpanded: true,
          //             isDense: true,
          //             items: productCategoryModel.results!.category!.map((Category value) {
          //               return DropdownMenuItem<Category>(
          //                 value: value,
          //                 child: Text(value.categoryName!),
          //               );
          //             }).toList(),
          //             onChanged: (newValue) {
          //               setState(() {
          //                 categoryData = newValue;
          //               });
          //             },
          //           ),
          //         ),
          //       )
          //     : const SizedBox(),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                border: Border.all(color: AppColors.colorBorder, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      style: AppFont.NUNITO_REGULAR_BLACK_14,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        // onSearchTextChanged(value);
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Search Product',
                          hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_searchController.text != "") {
                        NavKey.navKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (_) => SearchProductScreen(
                                searchProductName: _searchController.text),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please enter value for search product");
                      }
                    },
                    child: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          introSliderList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SizedBox(
                    height: 206,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.colorLightBlueGrey,
                            border: Border.all(
                                color: AppColors.colorBorder, width: 1.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Image.network(
                            introSliderList[_pos].image!,
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            height: 204,
                            fit: BoxFit.fill,
                            errorBuilder: (BuildContext? context,
                                Object? exception, StackTrace? stackTrace) {
                              return Image.asset(
                                APPImages.icError,
                                width: MediaQuery.of(context!).size.width *
                                    90 /
                                    100,
                                height: 204,
                              );
                            },
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 18),
          // productListModel.results != null && productListModel.results!.product!.isNotEmpty
          //     ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              dragStartBehavior: DragStartBehavior.down,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3.0,
                childAspectRatio: 10 / 11,
              ),
              itemCount: catModel.length,
              itemBuilder: (BuildContext context, int index) {
                return catItem(catModel[index]);
              },
            ),
          ),
          // : const SizedBox(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget catItem(CategoryModel catItem) {
    return InkWell(
      onTap: () {
        NavKey.navKey.currentState!.push(
          MaterialPageRoute(
              builder: (_) => CategoryNameScreen(
                    id: catItem.id,
                    catrgoryName: catItem.name,
                  )),
        );
      },
      child: Card(
        color: AppColors.colorLightBlueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0, bottom: 3),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                catItem.image,
                // height: MediaQuery.of(context).size.height * 0.1,
                fit: BoxFit.contain,
                width: 46,
                height: 46,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error_outline,
                    color: AppColors.PRIMARY_TEXT_COLOR,
                    size: 30,
                  );
                },
              ),
              const SizedBox(height: 10),
              Padding(
                // padding: const EdgeInsets.all(0),
                padding:
                    const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 2),
                child: Center(
                  child: AutoSizeText(
                    catItem.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12.0),
                    maxLines: 3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {
      _notifier.value = 0;
    });
  }

  callProductListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.productListWithOutSellerId().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
              introWidgetsList = [];
            } else {
              productListModel = WIthOutLoginProductListModel.fromJson(value);
              for (var item in productListModel.results!.product!) {
                introWidgetsList.add(SwipeWidgetModel(image: item.image1!));
              }
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
            introWidgetsList = [];
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          introWidgetsList = [];
        }
      });
    } else {
      introWidgetsList = [];
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }

  callSliderApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.sliders().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
              introSliderList = [];
            } else {
              sliderModel = SliderModel.fromJson(value);
              for (var item in sliderModel.results!.slides!) {
                introSliderList.add(SwipeWidgetModel(image: item.image!));
              }
            }
          } catch (ex) {
            print(ex);
            introSliderList = [];
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          introSliderList = [];
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      introSliderList = [];
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }

  callProductCategoryListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.getProductCategory().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productCategoryModel = ProductCategoryModel.fromJson(value);
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }
}
