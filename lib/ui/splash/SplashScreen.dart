import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/WelcomScreenMessage.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import '../../utils/app_font.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.colorWhite));

    /*if (!PreferenceHelper.getBool(PreferenceHelper.IS_FIRST_TIME)) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        NavKey.navKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const WelcomeScreenMessage()),
            (route) => false);
      });
    } else {
      moveTo();
    }*/

    moveTo();
    super.initState();
  }

  void moveTo() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      // PreferenceHelper.setBool(PreferenceHelper.IS_FIRST_TIME, true);
      if (PreferenceHelper.getBool(PreferenceHelper.IS_SIGN_IN)) {
        if (PreferenceHelper.getBool(PreferenceHelper.IS_SELLER_SIGN_IN)) {
          NavKey.navKey.currentState!.pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (_) => HomeScreenNavigation(
                        selectedIndex: 0,
                      )),
              (route) => false);
        } else {
          NavKey.navKey.currentState!.pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (_) => BuyerHomeScreenNavigation(
                        selectedIndex: 0,
                      )),
              (route) => false);
        }
      } else {
        NavKey.navKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => WithOutLoginNavigation(
                      selectedIndex: 0,
                    )),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isIOS ? false : true,
      bottom: Platform.isIOS ? false : true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.colorWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container()),
              Container(
                height: 236,
                width: 236,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.colorWhite,
                alignment: Alignment.center,
                child: Image.asset(
                  APPImages.icSplashLogo,
                  height: 230,
                  width: 230,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Welcome to Alang world!',
                textAlign: TextAlign.center,
                style: AppFont.NUNITO_REGULAR_BLACK_20,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
