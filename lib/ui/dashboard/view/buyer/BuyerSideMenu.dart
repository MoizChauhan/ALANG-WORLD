import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerAlangWorldScreen.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import 'BuyerContactUsScreen.dart';

class BuyerSideMenu extends StatefulWidget {
  const BuyerSideMenu({Key? key}) : super(key: key);

  @override
  _BuyerSideMenuState createState() => _BuyerSideMenuState();
}

class _BuyerSideMenuState extends State<BuyerSideMenu> {
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
              NavKey.navKey.currentState!.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => BuyerHomeScreenNavigation(
                            selectedIndex: 0,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Search Product'),
            onTap: () {
              Navigator.pop(context);
              NavKey.navKey.currentState!.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => BuyerHomeScreenNavigation(
                            selectedIndex: 1,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pop(context);
              NavKey.navKey.currentState!.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => BuyerHomeScreenNavigation(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const BuyerAlangWorldScreen()));
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Contact US'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const BuyerContactUsScreen()));
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
    AppWidgets.showConfirmationDialog(
        context, 'Logout', (MediaQuery.of(context).size.height / 80.0) * 19,
        actionLabelOne: APPStrings.NO,
        actionLabelTwo: APPStrings.YES, onClickActionOne: () {
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
