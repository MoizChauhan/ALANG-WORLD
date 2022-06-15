import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/utils/app_colors.dart';

import '../../../../utils/NavKey.dart';
import '../../../../utils/app_font.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/preference_helper.dart';
import '../../../auth/model/CommonModel.dart';
import '../../../auth/view/SellerLogin.dart';
import '../../model/ProductListModel.dart';
import '../../model/WIthOutLoginProductListModel.dart';
import '../../provider/HomeProvider.dart';
import '../ProductDetailsScreen.dart';
import '../notification.dart';

class SearchProductScreen extends StatefulWidget {
  String? searchProductName;

  SearchProductScreen({Key? key, this.searchProductName}) : super(key: key);

  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  WIthOutLoginProductListModel productListModel =
      WIthOutLoginProductListModel();
  HomeProvider? mHomeProvider;

  @override
  void initState() {
    if (widget.searchProductName != null) {
      callSearchProductListApi(widget.searchProductName!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Image.asset(
                    APPImages.icSplashLogo,
                    height: 65,
                    width: 65,
                  ),
                  if (PreferenceHelper.getBool(
                      PreferenceHelper.IS_SIGN_IN)) ...{
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          NavKey.navKey.currentState!.push(
                            MaterialPageRoute(
                                builder: (_) => const NotificationPage()),
                          );
                        },
                      ),
                    ),
                  },
                ],
              ),
              productListModel.results != null &&
                      productListModel.results!.product!.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemBuilder: (context, index) {
                          return buildProductItem(
                              productListModel.results!.product![index]);
                        },
                        itemCount: productListModel.results!.product!.length,
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text(
                          "No product found!",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
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
                      )));
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
                // "https://statinfer.com/wp-content/uploads/dummy-user.png",
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
                    Text(
                      product.productName!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.categoryname!,
                      style: const TextStyle(fontSize: 8),
                    ),
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
                      child: Text(
                        'CONTACT NOW',
                        style: AppFont.NUNITO_REGULAR_WHITE_10,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (!PreferenceHelper.getBool(
                      PreferenceHelper.IS_SIGN_IN)) {
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

  callSearchProductListApi(String searchProductName) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!
          .searchProductListFromString(searchProductName)
          .then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productListModel = WIthOutLoginProductListModel.fromJson(value);
              debugPrint("productListModel ==>> " +
                  productListModel.toJson().toString());
            }
          } catch (ex) {
            debugPrint(ex.toString());
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
