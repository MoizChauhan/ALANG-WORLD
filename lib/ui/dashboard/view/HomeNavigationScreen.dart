import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sb_portal/ui/dashboard/view/AddProductScreen.dart';
import 'package:sb_portal/ui/dashboard/view/HomeScreen.dart';
import 'package:sb_portal/ui/dashboard/view/MyProfileScreen.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/common/show_single_dialog.dart';

import '../../../utils/NavKey.dart';
import 'notification.dart';

class HomeScreenNavigation extends StatefulWidget {
  int? selectedIndex = 0;

  HomeScreenNavigation({Key? key, this.selectedIndex}) : super(key: key);

  @override
  _HomeScreenNavigationState createState() => _HomeScreenNavigationState();
}

class _HomeScreenNavigationState extends State<HomeScreenNavigation> {
  int page = 0;

  bool isProductAdd = false;

  @override
  void initState() {
    page = widget.selectedIndex!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onWillPop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: SideMenu(),
          backgroundColor: AppColors.colorWhite,
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
          body: getBody(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: page,
            onTap: (_position) {
              setState(() {
                page = _position;
              });
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
                  Icons.add_circle_outline,
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
      ),
    );
  }

   getBody() {
    if (page == 0) {
      return const HomeScreen();
    } else if (page == 1) {
      return AddProductScreen(isProductAdd: isProductAdd);
    } else if (page == 2) {
      return const MyProfileScreen();
    }
  }

  _onWillPop() {
    DialogSingleClick.showCustomDialog(context,
        title: 'Do you want to exit an app',
        okBtnText: 'OK',
        cancelBtnText: 'Cancel', okBtnFunction: () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }
}
