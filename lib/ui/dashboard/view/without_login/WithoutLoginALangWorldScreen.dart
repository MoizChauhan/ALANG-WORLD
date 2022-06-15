// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/about_us_body.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/widget/WithOutLoginSidemenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';

class WithoutLoginALangWorldScreen extends StatefulWidget {
  const WithoutLoginALangWorldScreen({Key? key}) : super(key: key);

  @override
  _WithoutLoginALangWorldScreenState createState() =>
      _WithoutLoginALangWorldScreenState();
}

class _WithoutLoginALangWorldScreenState
    extends State<WithoutLoginALangWorldScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const WithOutLoginSidemenu(),
        appBar: AppBar(
            toolbarHeight: 80,
            foregroundColor: Colors.black,
            leadingWidth: 70,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    APPImages.icSplashLogo,
                    height: 65,
                    width: 65,
                  ),
                  /*Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),*/
                  /*IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      NavKey.navKey.currentState!.push(
                        MaterialPageRoute(
                          builder: (_) => const NotificationPage(),
                        ),
                      );
                    },
                  ),*/
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        backgroundColor: AppColors.colorWhite,
        body: Column(
          children: [
            Expanded(child: AboutUsBody()),
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
                      padding: const EdgeInsets.symmetric(vertical: 2),
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
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      color: AppColors.colorSKyBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
