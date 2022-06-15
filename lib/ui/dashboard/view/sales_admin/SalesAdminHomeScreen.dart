import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sb_portal/ui/dashboard/model/get_seller_details_model.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import 'SellerProductListScreen.dart';
import 'package:http/http.dart' as http;

class SalesAdminHomeScreen extends StatefulWidget {
  const SalesAdminHomeScreen({Key? key}) : super(key: key);

  @override
  _SalesAdminHomeScreenState createState() => _SalesAdminHomeScreenState();
}

class _SalesAdminHomeScreenState extends State<SalesAdminHomeScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();
  late GetSellerDataModel getSellerDataModel;
  late List<Seller> sellerList = [];

  getSellerData() async {
    debugPrint( "API Call getSellerData");
    var url =
        APPStrings.baseUrl + "get_seller?mobile=${_mobileController.text}";

    var value = await http.get(Uri.parse(url));

    var jsonValue = json.decode(value.body) as Map<String, dynamic>;
    if (jsonValue["response"] == "success") {
      getSellerDataModel = GetSellerDataModel.fromJson(jsonValue);
      debugPrint( "getSellerDataModel -->> "+ getSellerDataModel.toJson().toString());
      if (getSellerDataModel != null && getSellerDataModel.results != null) {
        sellerList = getSellerDataModel.results!.seller!;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Column(
          children: [
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        '+91',
                        style: AppFont.NUNITO_REGULAR_BLACK_14,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        color: AppColors.colorBtnBlack,
                        width: 32,
                        height: 1,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _mobileController,
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          style: AppFont.NUNITO_REGULAR_BLACK_14,
                          keyboardType: TextInputType.number,
                          focusNode: _mobileFocus,
                          onFieldSubmitted: (term) {
                            _mobileFocus.unfocus();
                            FocusScope.of(context).requestFocus(null);
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              counterText: "",
                              hintText: 'Mobile number',
                              hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: InputBorder.none),
                        ),
                        Container(
                          color: AppColors.colorBtnBlack,
                          width: double.maxFinite,
                          height: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              child: GestureDetector(
                child: Material(
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.colorOrange,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: MaterialButton(
                        onPressed: null,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: AppColors.colorWhite,
                            ),
                            const SizedBox(width: 4),
                            Text('SEARCH SELLER',
                                style: AppFont.NUNITO_BOLD_WHITE_18),
                          ],
                        )),
                  ),
                ),
                onTap: () {
                  getSellerData();
                },
              ),
            ),
            const SizedBox(height: 22),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildSellerItem(sellerList[index]);
                },
                itemCount: sellerList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildSellerItem(Seller data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.colorLightBlueGrey,
          border: Border.all(color: AppColors.colorBorder, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: InkWell(
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.business,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    data.sellerDetails!.company ?? "",
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    data.name ?? "",
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    data.sellerDetails!.mobile ?? "",
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    data.email ?? "",
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    data.sellerDetails!.district ?? "",
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            PreferenceHelper.setString(
                PreferenceHelper.SELLER_ID, data.id.toString());
            NavKey.navKey.currentState!.push(MaterialPageRoute(
                builder: (_) => SellerProductListScreen(
                      sellerId: data.id ?? 0,
                    )));
          },
        ),
      ),
    );
  }
}
