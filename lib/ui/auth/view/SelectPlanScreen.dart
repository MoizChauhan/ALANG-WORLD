import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/model/ListPlanModel.dart';
import 'package:sb_portal/ui/auth/model/SelectPlanModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/auth/view/PurchasePlanScreen.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  @override
  _SelectPlanScreenState createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  AuthProvider? mAuthProvider;

  List<ListPlanResults> planListRes = [];
  String? planId;

  @override
  void initState() {
    callPlanList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mAuthProvider = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: mAuthProvider!.isRequestSend,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Image.asset(
                  APPImages.icSplashLogo,
                  width: 139,
                  height: 139,
                ),
                const SizedBox(height: 32),
                Text(
                  'SELECT PLAN',
                  style: AppFont.NUNITO_SEMI_BOLD_BLACK_24,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return buildPlan(planListRes[index]);
                    },
                    itemCount: planListRes.length,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  child: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorOrange,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: MaterialButton(onPressed: null, child: Text('NEXT', style: AppFont.NUNITO_REGULAR_WHITE_16)),
                    ),
                  ),
                  onTap: () {
                    if (planId == null || planId!.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please select plan first');
                    } else {
                      callSelectPlan();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildPlan(ListPlanResults planList) {
    String planValidity = (int.parse(planList.validity!) / 30).floor().toString() + 'Months';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            planId = planList.id.toString();
            for (ListPlanResults item in planListRes) {
              if (item.id == planList.id) {
                item.isSelected = !item.isSelected!;
              } else {
                item.isSelected = false;
              }
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.colorPlan,
            border:
                Border.all(color: planList.isSelected! ? AppColors.colorBlack : AppColors.colorLightBrown, width: planList.isSelected! ? 3.0 : 0.0),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    planList.planName!.toUpperCase(),
                    style: planList.isSelected! ? AppFont.NUNITO_BOLD_YELLOW_24 : AppFont.NUNITO_BOLD_SILVER_24,
                  )),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      child: Material(
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8),
                        color: planList.isSelected! ? AppColors.colorYellow : AppColors.colorSilverPlan,
                        child: Container(
                          alignment: Alignment.center,
                          // height: 28,
                          child: MaterialButton(
                              onPressed: null,
                              child: Text('₹ ' + planList.price!.split('.00').first + "/" + planValidity, style: AppFont.NUNITO_REGULAR_BLACK_18)),
                        ),
                      ),
                      onTap: () {
                        if (planId == null || planId!.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please select plan first');
                        } else {
                          callSelectPlan();
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Number of product upload: ${planList.noOfAllowedProducts}',
                style: AppFont.NUNITO_REGULAR_WHITE_16,
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  callPlanList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      mAuthProvider!.planList().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              ListPlanModel listPlanModel = ListPlanModel.fromJson(value);
              planListRes.addAll(listPlanModel.results!.plans!);
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

  callSelectPlan() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {APPStrings.paramPlanId: planId!};
      mAuthProvider!.selectPlan(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              SelectPlanModel selectPlanModel = SelectPlanModel.fromJson(value);
              Fluttertoast.showToast(msg: selectPlanModel.message!);
              NavKey.navKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const PurchasePlanScreen()), (route) => false);
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
