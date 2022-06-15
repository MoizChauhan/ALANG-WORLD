import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SelectPlanScreen.dart';
import 'package:sb_portal/ui/auth/view/SellerOtpVerifyScreen.dart';
import 'package:sb_portal/ui/dashboard/view/AlangWorldScreen.dart';
import 'package:sb_portal/ui/dashboard/view/ConatctUsScreen.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/MyPlanScreen.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:sb_portal/utils/preference_helper.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            APPImages.icSplashLogo,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeScreenNavigation(
                            selectedIndex: 0,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('My Product'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeScreenNavigation(
                            selectedIndex: 0,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeScreenNavigation(
                            selectedIndex: 1,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('My Plan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyPlanScreen()));
              // MaterialPageRoute(builder: (_) => const MyPlanScreen()));
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeScreenNavigation(
                            selectedIndex: 2,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Alang World'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AlangWorldScreen()));
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Contact US'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactUsScreen()));
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    );
  }

  void logout() {
    AppWidgets.showConfirmationDialog(context, 'Logout', (MediaQuery.of(context).size.height / 80.0) * 19,
        actionLabelOne: APPStrings.NO, actionLabelTwo: APPStrings.YES, onClickActionOne: () {
      Navigator.of(context).pop();
    }, onClickActionTwo: () {
      PreferenceHelper.clear();
      Navigator.of(context).pop();
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => WithOutLoginNavigation(
                    selectedIndex: 0,
                  )),
          (route) => false);
    });
  }
}
