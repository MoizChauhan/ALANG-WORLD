import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/model/MyPlanModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/notification.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class MyPlanScreen extends StatefulWidget {
  const MyPlanScreen({Key? key}) : super(key: key);

  @override
  _MyPlanScreenState createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  HomeProvider? mHomeProvider;
  MyPlanModel myPlanModel = MyPlanModel();
  int page = 0;

  @override
  void initState() {
    callMyPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          drawer: SideMenu(),
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
                                builder: (_) => const NotificationPage()),
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
          body: myPlanModel.results != null
              ? Column(
                  children: [
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.colorLightBlueGrey,
                          border: Border.all(
                              color: AppColors.colorBorder, width: 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            const Align(
                              child: Text(
                                'My Plan',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'RobotRegular'),
                              ),
                              alignment: Alignment.center,
                            ),
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Company Name',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(1.0),
                                        fontFamily: 'RobotRegular'),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              myPlanModel.results!.plan!.planName!,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'RobotRegular'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Plan',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(1.0),
                                        fontFamily: 'RobotRegular'),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            
                            Text(
                              myPlanModel.results!.plan!.planName!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'RobotRegular'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Product Upload Limit',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontFamily: 'RobotRegular'),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        myPlanModel.results!.plan!
                                            .noOfAllowedProducts!,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'RobotRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Validity',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontFamily: 'RobotRegular'),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        myPlanModel.results!.plan!.validity! +
                                            ' days',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'RobotRegular'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Plan Start Date',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontFamily: 'RobotRegular'),
                                            ),
                                            const Divider(
                                                thickness: 2,
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        myPlanModel.results!.planPurchase!
                                            .planPurchaseDate!,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'RobotRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Expire On',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontFamily: 'RobotRegular'),
                                            ),
                                            const Divider(
                                                thickness: 2,
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        myPlanModel.results!.planPurchase!
                                            .planExpiryDate!,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'RobotRegular'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 32),
                            /*Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                child: Material(
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.colorOrange,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 230,
                                    child: MaterialButton(
                                      onPressed: null,
                                      child: Text(
                                        'MY PLAN',
                                        style: AppFont
                                            .NUNITO_REGULAR_WHITE_BOLD_16,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(height: 10),*/
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: GestureDetector(
                            //     child: Material(
                            //       elevation: 0.0,
                            //       borderRadius: BorderRadius.circular(8),
                            //       color: AppColors.colorOrange,
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         height: 30,
                            //         width: 230,
                            //         child: MaterialButton(
                            //           onPressed: null,
                            //           child: Text(
                            //             'UPGRADE PLAN',
                            //             style: AppFont
                            //                 .NUNITO_REGULAR_WHITE_BOLD_16,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     onTap: () {},
                            //   ),
                            // ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (_position) {
              NavKey.navKey.currentState!.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => HomeScreenNavigation(
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

  callMyPlan() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.getUserPlan().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              myPlanModel = MyPlanModel.fromJson(value);
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }
}
