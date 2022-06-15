import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginALangWorldScreen.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';

import '../WithOutLoginContactUs.dart';
import '../WithoutLoginNavigation.dart';

class WithOutLoginSidemenu extends StatefulWidget {
  const WithOutLoginSidemenu({Key? key}) : super(key: key);

  @override
  _WithOutLoginSidemenuState createState() => _WithOutLoginSidemenuState();
}

class _WithOutLoginSidemenuState extends State<WithOutLoginSidemenu> {
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
                    builder: (_) => WithOutLoginNavigation(
                      selectedIndex: 0,
                    ),
                  ),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Login as Seller'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SellerLogin(
                            isFromSeller: true,
                          )),
                  (route) => false);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: const Text('Login as Buyer'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SellerLogin(
                            isFromSeller: false,
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
                      builder: (_) => const WithoutLoginALangWorldScreen()));
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
                      builder: (_) => const WithOutLoginContactUs()));
            },
          ),
        ],
      ),
    );
  }
}
