import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sb_portal/ui/dashboard/model/ProductListModel.dart';
import 'package:sb_portal/ui/dashboard/view/AddProductScreen.dart';
import 'package:sb_portal/ui/dashboard/view/EditProductScreen.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class SellerProductListScreen extends StatefulWidget {
  final int? sellerId;

  const SellerProductListScreen({Key? key, this.sellerId}) : super(key: key);

  @override
  _SellerProductListScreenState createState() =>
      _SellerProductListScreenState();
}

class _SellerProductListScreenState extends State<SellerProductListScreen> {
  late ProductListModel getSellerDataModel;
  late List<Product> sellerList = [];

  @override
  void initState() {
    getSellerData();
    super.initState();
  }

  getSellerData() async {
    var url = APPStrings.baseUrl + "get_product/${widget.sellerId}";

    var value = await http.get(Uri.parse(url));

    var jsonValue = json.decode(value.body) as Map<String, dynamic>;
    if (jsonValue["response"] == "success") {
      print(jsonValue);
      getSellerDataModel = ProductListModel.fromJson(jsonValue);
      if (getSellerDataModel != null && getSellerDataModel.results != null) {
        sellerList = getSellerDataModel.results!.product!;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   flexibleSpace: Container(
      //     color: Colors.redAccent,
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Row(
      //       children: [
      //         IconButton(
      //           color: Colors.black,
      //           icon: const Icon(Icons.arrow_back),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //         Expanded(
      //           child: Image.asset(
      //             APPImages.icSplashLogo,
      //             height: 65,
      //             width: 65,
      //           ),
      //         ),
      //         // IconButton(
      //         //   color: Colors.black,
      //         //   icon: const Icon(Icons.notifications),
      //         //   onPressed: () {},
      //         // ),
      //       ],
      //     ),
      //   ),
      //   backgroundColor: AppColors.colorWhite,
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    APPImages.icSplashLogo,
                    height: 65,
                    width: 65,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Text("List of Products",
                              style: AppFont.NUNITO_SEMI_BOLD_CHARCOAL_BLACK_18),
                          const SizedBox(height: 6),
                          Container(
                            height: 1,
                            color: AppColors.colorBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.colorOrange,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 121,
                        child: MaterialButton(
                          onPressed: null,
                          child: Row(
                            children: [
                              Text(
                                'ADD PRODUCT',
                                style: AppFont.NUNITO_BOLD_WHITE_12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      NavKey.navKey.currentState!.push(
                        MaterialPageRoute(
                          builder: (_) =>
                              AddProductScreen(isFromSealsAdmin: true),
                        ),
                      ).then((value) => getSellerData());
                    },
                  )
                ],
              ),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildProductItem(sellerList[index]);
                  },
                  itemCount: sellerList.length,
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
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          NavKey.navKey.currentState!.push(
            MaterialPageRoute(
                builder: (_) => EditProductScreen(
                      product: product,
                    )),
          ).then((value) => getSellerData());
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
                errorBuilder: (BuildContext? context, Object? exception,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.error_outlined,
                    size: 100,
                  );
                },
              ),
              const SizedBox(width: 13),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
