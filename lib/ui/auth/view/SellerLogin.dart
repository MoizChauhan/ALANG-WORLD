import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/model/SignUpModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/auth/view/SellerSignUpScreen.dart';
import 'package:sb_portal/ui/auth/view/forgot_password_screen.dart';
import 'package:sb_portal/ui/auth/view/send_otp.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/sales_admin/SellerAdminHomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/ui/helper/FirebaseNotificationHelper.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:sb_portal/utils/common/EmailValidator.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import 'SelectPlanScreen.dart';

class SellerLogin extends StatefulWidget {
  final bool? isFromSeller;

  const SellerLogin({Key? key, this.isFromSeller}) : super(key: key);

  @override
  _SellerLoginState createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  AuthProvider? mAuthProvider;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool isRemeberMe = false;
  bool isShowPass = true;

  @override
  void initState() {
    if (PreferenceHelper.getBool(PreferenceHelper.IS_REMEBER_ME)) {
      if (widget.isFromSeller!) {
        if (PreferenceHelper.getString(PreferenceHelper.LOGIN_TYPE) == 'seller') {
          emailController.text = PreferenceHelper.getString(PreferenceHelper.SELLER_EMAIL_ID);
          passwordController.text = PreferenceHelper.getString(PreferenceHelper.SELLER_PASSWORD);
        }
      } else {
        if (PreferenceHelper.getString(PreferenceHelper.LOGIN_TYPE) == 'buyer') {
          emailController.text = PreferenceHelper.getString(PreferenceHelper.SELLER_EMAIL_ID);
          passwordController.text = PreferenceHelper.getString(PreferenceHelper.SELLER_PASSWORD);
        }
      }
    } else {
      if (!kReleaseMode) {
        if (widget.isFromSeller!) {
          emailController.text = '7069307682';
          passwordController.text = 'Test@123';
        } else {
          emailController.text = '7069307682';
          passwordController.text = 'Test@123';
        }
      }
    }
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
          body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      APPImages.icSplashLogo,
                      width: 163,
                      height: 163,
                    ),
                    const SizedBox(height: 51),
                    widget.isFromSeller!
                        ? Text('SELLER LOGIN', style: AppFont.NUNITO_SEMI_BOLD_BLACK_24)
                        : Text('BUYER LOGIN', style: AppFont.NUNITO_SEMI_BOLD_BLACK_24),
                    /*Container(
                      color: AppColors.colorBtnBlack,
                      width: 160,
                      height: 2,
                    ),*/
                    const SizedBox(height: 32),
                    AppWidgets.buildInputFields(
                      emailController,
                      "Mobile Number/Email Address",
                      false,
                      emailFocus,
                      passwordFocus,
                      context,
                    ),
                    const SizedBox(height: 16),
                    AppWidgets.buildPasswordInputFields(
                      passwordController,
                      "Password",
                      isShowPass,
                      passwordFocus,
                      null,
                      context,
                      onPressedPass: () {
                        setState(() {
                          isShowPass = !isShowPass;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: Icon(
                                isRemeberMe ? Icons.check_box : Icons.check_box_outline_blank,
                              ),
                              onTap: () {
                                setState(() {
                                  isRemeberMe = !isRemeberMe;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Remember Me',
                              textAlign: TextAlign.start,
                              style: AppFont.NUNITO_REGULAR_BLACK_14,
                            ),
                          ],
                        ),
                        Expanded(
                          child: InkWell(
                            child: Text(
                              APPStrings.FORGOT_PASSWORD,
                              textAlign: TextAlign.end,
                              style: AppFont.NUNITO_REGULAR_BLACK_14,
                            ),
                            onTap: () {
                              NavKey.navKey.currentState!.push(MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      child: Material(
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.colorOrange,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: MaterialButton(onPressed: null, child: Text('LOGIN', style: AppFont.NUNITO_BOLD_WHITE_24)),
                        ),
                      ),
                      onTap: () {
                        isValid();
                      },
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      child: Material(
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.colorOrange,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: MaterialButton(onPressed: null, child: Text('SIGN-UP', style: AppFont.NUNITO_BOLD_WHITE_24)),
                        ),
                      ),
                      onTap: () {
                        NavKey.navKey.currentState!.push(MaterialPageRoute(
                            builder: (_) => SendOtp(
                                  isFromSeller: widget.isFromSeller!,
                                )));
                      },
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        NavKey.navKey.currentState!.pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => WithOutLoginNavigation(
                                      selectedIndex: 0,
                                    )),
                            (route) => false);
                      },
                      child: const Text(
                        'BACK TO HOME',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  isValid() async {
    if (emailController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email/mobile');
    } else if (emailController.text.trim().length <10) {
      Fluttertoast.showToast(msg: 'Mobile Number must contain 10 digit');
    // } else if (!Validator().hasMinLength(passwordController.text.toString().trim(), 6)) {
    //   Fluttertoast.showToast(msg: 'Please enter at least 6 character in confirm password');
    // } else if (!Validator().hasMinNormalChar(passwordController.text.toString().trim(), 1)) {
    //   Fluttertoast.showToast(msg: 'Please enter at least 1 lower case letter in confirm password');
    // } /*else if (!Validator().hasMinUppercase(
    //                       _confirmPasswordController.text.toString().trim(),
    //                       1)) {
    //                     Fluttertoast.showToast(
    //                         msg:
    //                             'Please enter at least 1 upper case letter in confirm password');
    //                   }*/
    // else if (!Validator().hasMinNumericChar(passwordController.text.toString().trim(), 1)) {
    //   Fluttertoast.showToast(msg: 'Please enter at least 1 number in confirm password');
    // } else if (!Validator().hasMinSpecialChar(passwordController.text.toString().trim(), 1)) {
    //   Fluttertoast.showToast(msg: 'Please enter at least 1 non-alphanumeric symbol in confirm password');
    } else {
      callSignInApi();
    }
  }

  callSignInApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      String? firebaseToken = await FirebaseNotificationHelper.getInstance().getFcmToken();
      Map<String, String> body = {
        APPStrings.paramEmail: emailController.text.toString().trim(),
        APPStrings.paramPassword: passwordController.text.toString().trim(),
        APPStrings.paramType: widget.isFromSeller! ? 'seller' : 'buyer',
        APPStrings.paramFirebaseId: firebaseToken!,
      };

      mAuthProvider!.login(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              SignUpModel signUpModel = SignUpModel.fromJson(value);
              Fluttertoast.showToast(msg: signUpModel.message!);
              if (signUpModel.results!.user!.userDetails!.userRole == 'sales_admin') {
                PreferenceHelper.setBool(PreferenceHelper.IS_SIGN_IN, true);
                PreferenceHelper.setString(PreferenceHelper.AUTH_TOKEN, signUpModel.results!.user!.userDetails!.token!);
                if (widget.isFromSeller!) {
                  PreferenceHelper.setBool(PreferenceHelper.IS_SELLER_SIGN_IN, true);
                  NavKey.navKey.currentState!.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (_) => SellerAdminHomeNavigationScreen(
                                selectedIndex: 0,
                              )),
                      (route) => false);
                }
              } else {
                PreferenceHelper.setBool(PreferenceHelper.IS_SIGN_IN, true);
                PreferenceHelper.setString(PreferenceHelper.SELLER_ID, signUpModel.results!.user!.id!.toString());
                PreferenceHelper.setString(PreferenceHelper.AUTH_TOKEN, signUpModel.results!.user!.userDetails!.token!);
                if (isRemeberMe) {
                  PreferenceHelper.setBool(PreferenceHelper.IS_REMEBER_ME, isRemeberMe);
                  PreferenceHelper.setString(PreferenceHelper.SELLER_EMAIL_ID, emailController.text.toString());
                  PreferenceHelper.setString(PreferenceHelper.SELLER_PASSWORD, passwordController.text.toString());
                  if (widget.isFromSeller!) {
                    PreferenceHelper.setString(PreferenceHelper.LOGIN_TYPE, 'seller');
                  } else {
                    PreferenceHelper.setString(PreferenceHelper.LOGIN_TYPE, 'buyer');
                  }
                }
                if (widget.isFromSeller!) {
                  PreferenceHelper.setBool(PreferenceHelper.IS_SELLER_SIGN_IN, true);

                  /// If User Don't have purchase any plan than it will give plan selection screen
                  if (signUpModel.results!.isHavePlan!) {
                    NavKey.navKey.currentState!.pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (_) => HomeScreenNavigation(
                                  selectedIndex: 0,
                                )),
                        (route) => false);
                  } else {
                    NavKey.navKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const SelectPlanScreen(upgrade: false)), (route) => false);
                  }
                } else {
                  PreferenceHelper.setBool(PreferenceHelper.IS_SELLER_SIGN_IN, false);
                  NavKey.navKey.currentState!.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (_) => BuyerHomeScreenNavigation(
                                selectedIndex: 0,
                              )),
                      (route) => false);
                }
              }
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
