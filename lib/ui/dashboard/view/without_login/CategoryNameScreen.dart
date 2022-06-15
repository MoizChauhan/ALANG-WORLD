import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/model/ProductListModel.dart';
import 'package:sb_portal/ui/dashboard/model/WIthOutLoginProductListModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/ProductDetailsScreen.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerSideMenu.dart';
import 'package:sb_portal/ui/dashboard/view/notification.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/widget/WithOutLoginSidemenu.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/preference_helper.dart';

class CategoryNameScreen extends StatefulWidget {
  int id;
  String catrgoryName;

  CategoryNameScreen({Key? key, required this.id, required this.catrgoryName})
      : super(key: key);

  @override
  _CategoryNameScreenState createState() => _CategoryNameScreenState();
}

class _CategoryNameScreenState extends State<CategoryNameScreen> {
  final TextEditingController _searchController = TextEditingController();
  WIthOutLoginProductListModel productListModel =
      WIthOutLoginProductListModel();
  HomeProvider? mHomeProvider;
  List<Product> searchProd = [];

  @override
  void initState() {
    callProductWithIDListApi(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          drawer: PreferenceHelper.getBool(PreferenceHelper.IS_SIGN_IN)
              ? const BuyerSideMenu()
              : const WithOutLoginSidemenu(),
          appBar: AppBar(
              toolbarHeight: 80,
              foregroundColor: Colors.black,
              leadingWidth: 70,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: /*Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          color: Colors.black,
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),*/
                          Container(),
                    ),
                    Image.asset(
                      APPImages.icSplashLogo,
                      height: 65,
                      width: 65,
                    ),
                    PreferenceHelper.getBool(PreferenceHelper.IS_SIGN_IN)
                        ? Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.notifications),
                                onPressed: () {
                                  NavKey.navKey.currentState!.push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const NotificationPage()),
                                  );
                                },
                              ),
                            ),
                          )
                        : Expanded(child: Container()),
                  ],
                ),
              ),
              backgroundColor: AppColors.colorWhite,
              elevation: 0.0),
          backgroundColor: AppColors.colorWhite,
          body: Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(widget.catrgoryName,
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_20),
              ),
              /*const SizedBox(height: 6),
              Container(
                height: 1,
                width: 150,
                color: AppColors.colorBlack,
              ),*/
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    border:
                        Border.all(color: AppColors.colorBorder, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                            onSearchTextChanged(value);
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Search product',
                              hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: InputBorder.none),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
              ),
              _searchController.text.isNotEmpty
                  ? searchProd.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return buildProductItem(searchProd[index]);
                            },
                            itemCount: searchProd.length,
                          ),
                        )
                      : const SizedBox()
                  : productListModel.results != null &&
                          productListModel.results!.product!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildProductItem(
                                productListModel.results!.product![index]);
                          },
                          itemCount: productListModel.results!.product!.length,
                        ))
                      : const SizedBox(),
              if (PreferenceHelper.getBool(PreferenceHelper.IS_SELLER_SIGN_IN))
                const SizedBox(height: 16),
              if (PreferenceHelper.getBool(PreferenceHelper.IS_SELLER_SIGN_IN))
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'SIGN UP/SIGN IN',
                                style: AppFont.NUNITO_REGULAR_WHITE_12,
                              ),
                              Text(
                                'SELLER',
                                style: AppFont.NUNITO_BOLD_WHITE_18,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: AppColors.colorOrange,
                        ),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SellerLogin(
                                        isFromSeller: true,
                                      )),
                              (route) => false);
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SellerLogin(
                                        isFromSeller: false,
                                      )),
                              (route) => false);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'SIGN UP/SIGN IN',
                                style: AppFont.NUNITO_REGULAR_WHITE_12,
                              ),
                              Text(
                                'BUYER',
                                style: AppFont.NUNITO_BOLD_WHITE_18,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: AppColors.colorSKyBlue,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                        product: product,
                      ))).then((value) {
            callProductWithIDListApi(widget.id);
          });
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            bottom: 8,
            top: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.colorLightBlueGrey,
            border: Border.all(color: AppColors.colorBorder, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              Image.network(
                product.image1!,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext? context, Object? exception,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.error_outlined,
                    size: 100,
                  );
                },
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.productName!,
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(product.categoryname!,
                        style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                child: Material(
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.colorBtnBlack,
                  child: Container(
                    alignment: Alignment.center,
                    height: 28,
                    child: MaterialButton(
                        onPressed: null,
                        child: Text('CONTACT NOW',
                            style: AppFont.NUNITO_REGULAR_WHITE_10)),
                  ),
                ),
                onTap: () {
                  if (!PreferenceHelper.getBool(PreferenceHelper.IS_SIGN_IN)) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SellerLogin(
                                  isFromSeller: false,
                                )),
                        (route) => false);
                  } else {
                    callContactNowApi(product);
                  }
                },
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }

  callContactNowApi(Product product) async {
    String buyerId = PreferenceHelper.getString(PreferenceHelper.SELLER_ID);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramProductId: product.id.toString(),
        // APPStrings.paramSellerId: product.sellerId.toString(),
        // APPStrings.paramBuyerId: buyerId,
      };
      mHomeProvider!.contactNow(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              Fluttertoast.showToast(msg: streams.message);
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

  callProductWithIDListApi(int id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.productListWithSellerId(id).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productListModel = WIthOutLoginProductListModel.fromJson(value);
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

  onSearchTextChanged(String text) async {
    searchProd.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in productListModel.results!.product!) {
      if (userDetail.productName!.toLowerCase().contains(text.toLowerCase()) ||
          userDetail.categoryname!.toString().contains(text.toLowerCase())) {
        searchProd.add(userDetail);
      }
    }
    setState(() {});
  }

// callProductListApi() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile ||
//       connectivityResult == ConnectivityResult.wifi) {
//     mHomeProvider!.productListWithOutSellerId().then((value) {
//       if (value != null) {
//         try {
//           CommonModel streams = CommonModel.fromJson(value);
//           if (streams.response != null && streams.response == "error") {
//             Fluttertoast.showToast(msg: streams.message);
//           } else {
//             productListModel = WIthOutLoginProductListModel.fromJson(value);
//           }
//         } catch (ex) {
//           print(ex);
//           Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
//         }
//       } else {
//         Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
//       }
//     });
//   } else {
//     Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
//   }
// }
}
