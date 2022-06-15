// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/model/ProductListModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/ProductDetailsScreen.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/preference_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? mHomeProvider;
  final TextEditingController _searchController = TextEditingController();
  ProductListModel productListModel = ProductListModel();
  ProductListModel searchProdModel = ProductListModel();
  List<Product> searchProd = [];

  @override
  void initState() {
    callProductListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    border: Border.all(color: AppColors.colorBorder, width: 1.0),
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
                              hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                productListModel.results != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.colorLightBlueGrey,
                          border: Border.all(color: AppColors.colorBorder, width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            Text('Total Number of Product :${productListModel.results!.count!.noOfAllowedProducts!.toString()}'),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: AutoSizeText(
                                      'Uploaded Product: ${productListModel.results!.count!.totalUploadedProducts!.toString()}',
                                    )),
                                Expanded(child: SizedBox()),
                                Flexible(
                                    flex: 2,
                                    child: AutoSizeText('Remaining Product: ${productListModel.results!.count!.totalRemainingProducts!.toString()}')),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 16),
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
                    : productListModel.results != null && productListModel.results!.product!.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return buildProductItem(productListModel.results!.product![index]);
                            },
                            itemCount: productListModel.results!.product!.length,
                          ))
                        : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                        product: product,
                      ))).then((value) {
            callProductListApi();
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.colorLightBlueGrey,
            border: Border.all(color: AppColors.colorBorder, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              // Image.network(APPStrings.baseUrl + product.image1!),
              Image.network(
                product.image1!,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext? context, Object? exception, StackTrace? stackTrace) {
                  return const Icon(
                    Icons.error_outlined,
                    size: 100,
                  );
                },
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.categoryname!,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  callProductListApi() async {
    String sellerID = PreferenceHelper.getString(PreferenceHelper.SELLER_ID);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.productList(sellerID).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productListModel = ProductListModel.fromJson(value);
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
      if (userDetail.productName!.toLowerCase().contains(text.toLowerCase()) || userDetail.categoryname!.toString().contains(text.toLowerCase())) {
        searchProd.add(userDetail);
      }
    }
    setState(() {});
  }
}
