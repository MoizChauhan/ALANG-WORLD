import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/widget/WithOutLoginSidemenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/NavKey.dart';
import '../notification.dart';

class WithOutLoginContactUs extends StatefulWidget {
  const WithOutLoginContactUs({Key? key}) : super(key: key);

  @override
  _WithOutLoginContactUsState createState() => _WithOutLoginContactUsState();
}

class _WithOutLoginContactUsState extends State<WithOutLoginContactUs> {
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
                  /*IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),*/
                  Image.asset(APPImages.icSplashLogo, height: 65, width: 65,),
                  /*Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        NavKey.navKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (_) => const NotificationPage(),
                          ),
                        );
                      },
                    ),
                  ),*/
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        backgroundColor: AppColors.colorWhite,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_20,
                  ),
                  const SizedBox(height: 32),
                  Image.asset(APPImages.icSplashLogo,
                    width: 150, height: 150,),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.email,
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          _openUrl('mailto:${'info@alangworld.com'}');
                        },
                        child: Text(
                            'info@alangworld.com',
                            style: AppFont.NUNITO_BOLD_BLACK_16
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.call,
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          _openUrl('tel:${'+919510264074'}');
                        },
                        child: Text(
                            '+91 9510264074',
                            style: AppFont.NUNITO_BOLD_BLACK_16
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  //Text('Copyright Line/Web URL', style: AppFont.NUNITO_REGULAR_DARK_BLACK_16)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Text('SIGN UP/SIGN IN', style: AppFont.NUNITO_REGULAR_WHITE_12,),
                          Text('SELLER', style: AppFont.NUNITO_BOLD_WHITE_18,),
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
                          Text('SIGN UP/SIGN IN',style: AppFont.NUNITO_REGULAR_WHITE_12,),
                          Text('BUYER', style: AppFont.NUNITO_BOLD_WHITE_18,),
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

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
