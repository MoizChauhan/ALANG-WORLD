import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';

import '../../../utils/NavKey.dart';
import '../../../utils/preference_helper.dart';
import 'HomeNavigationScreen.dart';
import 'buyer/BuyerHomeScreenNavigation.dart';

class WelcomeScreenMessage extends StatefulWidget {
  const WelcomeScreenMessage({Key? key}) : super(key: key);

  @override
  _WelcomeScreenMessageState createState() => _WelcomeScreenMessageState();
}

class _WelcomeScreenMessageState extends State<WelcomeScreenMessage> {
  @override
  void initState() {
    moveTo();
    super.initState();
  }

  void moveTo() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      PreferenceHelper.setBool(PreferenceHelper.IS_FIRST_TIME, true);
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
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(APPImages.icSplashLogo,width: 150,height: 150),
              const SizedBox(height: 40),
              Text(
                'WELCOME MSG',
                textAlign: TextAlign.center,
                style: AppFont.NUNITO_BOLD_DARK_CHARCOALBLACK_26,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to Alang World!',
                textAlign: TextAlign.center,
                style: AppFont.NUNITO_BOLD_DARK_CHARCOALBLACK_18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
