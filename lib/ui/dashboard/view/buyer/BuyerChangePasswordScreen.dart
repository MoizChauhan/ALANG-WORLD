import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';

import '../../../auth/view/SellerSignUpScreen.dart';

class BuyerChangePasswordScreen extends StatefulWidget {
  const BuyerChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _BuyerChangePasswordScreenState createState() => _BuyerChangePasswordScreenState();
}

class _BuyerChangePasswordScreenState extends State<BuyerChangePasswordScreen> {
  AuthProvider? mAuthProvider;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _oldPasswordFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool isOldShowPass = true;
  bool isShowPass = true;
  bool isShowConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    mAuthProvider = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: mAuthProvider!.isRequestSend,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                        onTap: () {
                          NavKey.navKey.currentState!.pop();
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            "CHANGE PASSWORD",
                            style: AppFont.NUNITO_SEMI_BOLD_BLACK_NO_SIZE,
                            minFontSize: 18,
                            maxFontSize: 24,
                          ),
                          // Container(
                          //   color: AppColors.colorBtnBlack,
                          //   width: 160,
                          //   height: 2,
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildPasswordInputFields(
                    _oldPasswordController,
                    "Enter Old Password",
                    isOldShowPass,
                    _oldPasswordFocus,
                    _passwordFocus,
                    context,
                    onPressedPass: () {
                      setState(() {
                        isOldShowPass = !isOldShowPass;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildPasswordInputFields(
                    _passwordController,
                    "Enter Password",
                    isShowPass,
                    _passwordFocus,
                    _confirmPasswordFocus,
                    context,
                    onPressedPass: () {
                      setState(() {
                        isShowPass = !isShowPass;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Password must contain at least 8 characters, including 1 uppercase/lowercase, 1 number and 1 non-alphanumeric symbol",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildPasswordInputFields(
                    _confirmPasswordController,
                    "Enter Confirm Password",
                    isShowConfirmPass,
                    _confirmPasswordFocus,
                    null,
                    context,
                    onPressedPass: () {
                      setState(() {
                        isShowConfirmPass = !isShowConfirmPass;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Confirm password must contain at least 8 characters, including 1 uppercase/lowercase, 1 number and 1 non-alphanumeric symbol",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    child: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.colorOrange,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: MaterialButton(onPressed: null, child: Text('CHANGE PASSWORD', style: AppFont.NUNITO_BOLD_WHITE_24)),
                      ),
                    ),
                    onTap: () {
                      if (_oldPasswordController.text.toString().trim().isEmpty) {
                        Fluttertoast.showToast(msg: 'Please enter old password');
                      } else if (_passwordController.text.toString().trim().isEmpty) {
                        Fluttertoast.showToast(msg: 'Please enter password');
                      } else if (!Validator().hasMinLength(_passwordController.text.toString().trim(), 6)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 6 character in password');
                      } else if (!Validator().hasMinNormalChar(_passwordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 lower case letter in password');
                      } /*else if (!Validator().hasMinUppercase(
                          _passwordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(
                            msg:
                                'Please enter at least 1 upper case letter in password');
                      }*/
                      else if (!Validator().hasMinNumericChar(_passwordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 number in password');
                      } else if (!Validator().hasMinSpecialChar(_passwordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 non-alphanumeric symbol in password');
                      } else if (_confirmPasswordController.text.toString().trim().isEmpty) {
                        Fluttertoast.showToast(msg: 'Please enter confirm password');
                      } else if (!Validator().hasMinLength(_confirmPasswordController.text.toString().trim(), 6)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 6 character in confirm password');
                      } else if (!Validator().hasMinNormalChar(_confirmPasswordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 lower case letter in confirm password');
                      } /*else if (!Validator().hasMinUppercase(
                          _confirmPasswordController.text.toString().trim(),
                          1)) {
                        Fluttertoast.showToast(
                            msg:
                                'Please enter at least 1 upper case letter in confirm password');
                      }*/
                      else if (!Validator().hasMinNumericChar(_confirmPasswordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 number in confirm password');
                      } else if (!Validator().hasMinSpecialChar(_confirmPasswordController.text.toString().trim(), 1)) {
                        Fluttertoast.showToast(msg: 'Please enter at least 1 non-alphanumeric symbol in confirm password');
                      } else if (_passwordController.text.toString() != _confirmPasswordController.text.toString()) {
                        Fluttertoast.showToast(msg: 'Password and confirm password does not match');
                      } else {
                        callChangePasswordApi();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  callChangePasswordApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramOldPassword: _oldPasswordController.text.toString(),
        APPStrings.paramPassword: _passwordController.text.toString(),
        APPStrings.paramConfirmPassword: _confirmPasswordController.text.toString(),
      };
      mAuthProvider!.changePassword(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              _oldPasswordController.text = "";
              _passwordController.text = "";
              _confirmPasswordController.text = "";
              NavKey.navKey.currentState!.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => BuyerHomeScreenNavigation(
                            selectedIndex: 0,
                          )),
                  (route) => false);

              Fluttertoast.showToast(msg: streams.message);
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
