import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerSideMenu.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../notification.dart';

class BuyerContactUsScreen extends StatefulWidget {
  const BuyerContactUsScreen({Key? key}) : super(key: key);

  @override
  _BuyerContactUsScreenState createState() => _BuyerContactUsScreenState();
}

class _BuyerContactUsScreenState extends State<BuyerContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const BuyerSideMenu(),
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
                  Image.asset(
                    APPImages.icSplashLogo,
                    height: 65,
                    width: 65,
                  ),
                  Align(
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
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        backgroundColor: AppColors.colorWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact Us',
              style: AppFont.NUNITO_SEMI_BOLD_BLACK_20,
            ),
            const SizedBox(height: 32),
            Image.asset(
              APPImages.icSplashLogo,
              width: 150,
              height: 150,
            ),
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
                  child: Text('info@alangworld.com', style: AppFont.NUNITO_BOLD_BLACK_16),
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
                  child: Text('+91 9510264074', style: AppFont.NUNITO_BOLD_BLACK_16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("© Copyright 2022 Alang World Use of this App signifies your acceptance of Alang World’s Terms of Use.",
                  textAlign: TextAlign.center, style: AppFont.NUNITO_BOLD_BLACK_16),
            ),
            const SizedBox(height: 64),
            //Text('Copyright Line/Web URL', style: AppFont.NUNITO_REGULAR_DARK_BLACK_16)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_position) {
            NavKey.navKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (_) => BuyerHomeScreenNavigation(
                          selectedIndex: _position,
                        )),
                (route) => false);
          },
          showSelectedLabels: false,
          selectedItemColor: AppColors.colorWhite,
          backgroundColor: AppColors.colorBlack,
          selectedFontSize: 12.00,
          unselectedFontSize: 12.00,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 32,
              ),
              label: '',
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
