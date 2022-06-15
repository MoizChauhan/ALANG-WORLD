import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/about_us_body.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';

import 'notification.dart';

class AlangWorldScreen extends StatefulWidget {
  const AlangWorldScreen({Key? key}) : super(key: key);

  @override
  _AlangWorldScreenState createState() => _AlangWorldScreenState();
}

class _AlangWorldScreenState extends State<AlangWorldScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
            toolbarHeight: 80,
            foregroundColor: Colors.black,
            leadingWidth: 70,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  /*IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),*/
                  Expanded(child: Image.asset(APPImages.icSplashLogo, height: 65, width: 65,)),
                  IconButton(
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
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        backgroundColor: AppColors.colorWhite,
        body: const AboutUsBody(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_position) {
            NavKey.navKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
                HomeScreenNavigation(selectedIndex: _position,)), (route) => false);
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
              icon: Icon(Icons.home, size: 32,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline,  size: 32,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,  size: 32,),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
