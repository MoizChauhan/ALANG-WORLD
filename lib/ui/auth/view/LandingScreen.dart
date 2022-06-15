import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

import 'SelectPlanScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(APPImages.icSplashLogo,
                    width: 200, height: 200)),
            const SizedBox(height: 32),
            Text("Sign In/Sign up as", style: AppFont.NUNITO_REGULAR_BLACK_18),
            const SizedBox(height: 24),
            InkWell(
              child: Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorLightBrown,
                child: Container(
                  alignment: Alignment.center,
                  width: 220,
                  height: 40,
                  child: MaterialButton(
                      onPressed: null,
                      child: Text(APPStrings.SELLER,
                          style: AppFont.NUNITO_REGULAR_WHITE_16)),
                ),
              ),
              onTap: () {
                NavKey.navKey.currentState!.push(MaterialPageRoute(builder: (_) => const SellerLogin(isFromSeller: true,)));
              },
            ),
            const SizedBox(height: 16),
            InkWell(
              child: Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorLightBrown,
                child: Container(
                  alignment: Alignment.center,
                  width: 220,
                  height: 40,
                  child: MaterialButton(
                      onPressed: null,
                      child: Text(APPStrings.CUSTOMER,
                          style: AppFont.NUNITO_REGULAR_WHITE_16)),
                ),
              ),
              onTap: () {
                NavKey.navKey.currentState!.push(MaterialPageRoute(builder: (_) => const SellerLogin(isFromSeller: false,)));
              },
            )
          ],
        ),
      ),
    );
  }
}
