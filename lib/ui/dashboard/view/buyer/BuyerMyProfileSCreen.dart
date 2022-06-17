// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/model/MyProfileModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerChangePasswordScreen.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_string.dart';

import 'BuyerEditProfileScreen.dart';

class BuyerMyProfileScreen extends StatefulWidget {
  const BuyerMyProfileScreen({Key? key}) : super(key: key);

  @override
  _BuyerMyProfileScreenState createState() => _BuyerMyProfileScreenState();
}

class _BuyerMyProfileScreenState extends State<BuyerMyProfileScreen> {
  HomeProvider? mHomeProvider;
  MyProfileModel myProfileModel = MyProfileModel();

  @override
  void initState() {
    callMyProfileApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: myProfileModel.results != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.colorLightBlueGrey,
                            border: Border.all(color: AppColors.colorBorder, width: 1.0),
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "My Profile",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      // Container(
                                      //   width: 62,
                                      //   height: 1,
                                      //   color: Colors.black,
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      onPressed: () {
                                        NavKey.navKey.currentState!
                                            .push(MaterialPageRoute(
                                                builder: (_) => BuyerEditProfileScreen(
                                                      myProfileModel: myProfileModel,
                                                    )))
                                            .then((value) => callMyProfileApi());
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/edit.png"),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                              fontFamily: "InterMedium",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      myProfileModel.results!.profile!.name ?? "",
                                      style: const TextStyle(
                                        fontFamily: "InterMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.call,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      myProfileModel.results!.profile!.mobile ?? "",
                                      style: const TextStyle(
                                        fontFamily: "InterMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      myProfileModel.results!.profile!.email!,
                                      style: const TextStyle(
                                        fontFamily: "InterMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.cake,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      myProfileModel.results!.profile!.establishment_date ?? "",
                                      style: const TextStyle(
                                        fontFamily: "InterMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      myProfileModel.results!.profile!.address ?? "",
                                      style: const TextStyle(
                                        fontFamily: "InterMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            myProfileModel.results!.profile!.pincode ?? "",
                                            style: const TextStyle(
                                              fontFamily: "InterMedium",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.transgender,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            myProfileModel.results!.profile!.gender ?? "",
                                            style: const TextStyle(
                                              fontFamily: "InterMedium",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'City',
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                          endIndent: 20,
                                        ),
                                        Text(
                                          myProfileModel.results!.profile!.district!,
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'State',
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                          endIndent: 20,
                                        ),
                                        Text(
                                          myProfileModel.results!.profile!.state ?? "",
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Country',
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                          endIndent: 20,
                                        ),
                                        Text(
                                          myProfileModel.results!.profile!.country ?? "",
                                          style: const TextStyle(
                                            fontFamily: "InterMedium",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 32),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  child: Material(
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.colorOrange,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      // width: 205,
                                      child: MaterialButton(
                                        onPressed: null,
                                        child: Center(
                                          child: Text(
                                            'CHANGE PASSWORD',
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(fontFamily: "InterMedium", fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    NavKey.navKey.currentState!.push(MaterialPageRoute(builder: (_) => const BuyerChangePasswordScreen()));
                                  },
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  callMyProfileApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.getUserProfile().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              myProfileModel = MyProfileModel.fromJson(value);
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
