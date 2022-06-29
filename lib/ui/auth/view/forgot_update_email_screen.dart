import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/auth/view/SellerOtpVerifyScreen.dart';
import 'package:sb_portal/ui/auth/view/forgot_email_otp_verify.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/common/EmailValidator.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_font.dart';

String mobileNumber = "";

class ForgotUpdateEmailScreen extends StatefulWidget {
  final bool? isFromSeller;
  final String userToken;

  const ForgotUpdateEmailScreen({
    this.isFromSeller,
    required this.userToken,
  });

  @override
  _ForgotUpdateEmailScreenState createState() =>
      _ForgotUpdateEmailScreenState();
}

class _ForgotUpdateEmailScreenState extends State<ForgotUpdateEmailScreen> {
  AuthProvider? mAuthProvider;

  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _mobileFocus2 = FocusNode();

  @override
  void initState() {
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    APPImages.icSplashLogo,
                    width: 163,
                    height: 163,
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    // widget.isFromSeller!
                    //     ? 'SELLER REGISTRATION'
                    //     :
                    'FORGOT EMAIL',
                    textAlign: TextAlign.center,
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_24,
                  ),
                ),
                /*Container(
                  color: AppColors.colorBtnBlack,
                  width: 200,
                  height: 2,
                ),*/
                const SizedBox(height: 24),
                Text(
                  "Enter Your New Email Address",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.9),
                      fontFamily: 'RobotRegular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Expanded(
                        child: TextFormField(
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          style: AppFont.NUNITO_REGULAR_BLACK_18,
                          keyboardType: TextInputType.number,
                          focusNode: _mobileFocus,
                          onFieldSubmitted: (term) {
                            // _mobileFocus.nextFocus();
                            FocusScope.of(context).requestFocus(_mobileFocus2);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            counterText: "",
                            hintText: 'New Email Address',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "RobotRegular",
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          width: 200,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Expanded(
                        child: TextFormField(
                          controller: _confirmEmailController,
                          textInputAction: TextInputAction.next,
                          style: AppFont.NUNITO_REGULAR_BLACK_18,
                          keyboardType: TextInputType.number,
                          focusNode: _mobileFocus2,
                          onFieldSubmitted: (term) {
                            _mobileFocus2.unfocus();
                            // FocusScope.of(context).requestFocus(_emailFocus);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            counterText: "",
                            hintText: 'Confirm New Email Address',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "RobotRegular",
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          width: 200,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  child: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorOrange,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: MaterialButton(
                          onPressed: _callUpdateEmail,
                          child: Text(
                            'UPDATE',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(1.0),
                                fontFamily: 'RobotRegular'),
                          )),
                    ),
                  ),
                  onTap: _callUpdateEmail,
                  // onTap: () {},
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Note:",
                        textAlign: TextAlign.center,
                        style: AppFont.NUNITO_BOLD_BLACK_16.copyWith(
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          "Verify Your Registered Email Address before Login into Alang World.",
                          textAlign: TextAlign.start,
                          style: AppFont.NUNITO_BOLD_BLACK_16),
                    )
                  ],
                ),
                const SizedBox(height: 32),
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
    );
  }

  _callUpdateEmail() async {
    if (_emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'New Email Can\'t be empty');
    } else if (_confirmEmailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Confirm Email Can\'t be empty');
    } else if (!(_emailController.text.isValidEmail())) {
      Fluttertoast.showToast(msg: 'Invalid New Email');
    } else if (!(_confirmEmailController.text.isValidEmail())) {
      Fluttertoast.showToast(msg: 'Invalid Confirm Email');
    } else if (_confirmEmailController.text != _emailController.text) {
      Fluttertoast.showToast(msg: 'New Email and Confirm Email Should be same');
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> body = {
          APPStrings.paramValue: _confirmEmailController.text,
          APPStrings.paramUserToken: widget.userToken,
        };

        mAuthProvider!.updateEmailAddress(body).then((value) {
          print(value);
          if (value != null) {
            try {
              if (value["response"] != null && value["response"] == "success") {
                NavKey.navKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (_) => WithOutLoginNavigation(
                              selectedIndex: 0,
                            )),
                    (route) => false);
                Fluttertoast.showToast(msg: "Email Updated Successfully");
              } else {
                Fluttertoast.showToast(msg: value["message"]);
              }
            } catch (ex) {
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
}
