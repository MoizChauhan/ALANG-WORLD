import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/auth/view/SellerOtpVerifyScreen.dart';
import 'package:sb_portal/ui/auth/view/SellerSignUpScreen.dart';
import 'package:sb_portal/ui/auth/view/forgot_email_otp_verify.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_font.dart';

String mobileNumber = "";

class ForgotEmailNumberScreen extends StatefulWidget {
  final bool? isFromSeller;

  const ForgotEmailNumberScreen({this.isFromSeller});

  @override
  _ForgotEmailNumberScreenState createState() =>
      _ForgotEmailNumberScreenState();
}

class _ForgotEmailNumberScreenState extends State<ForgotEmailNumberScreen> {
  AuthProvider? mAuthProvider;

  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();

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
                  "Enter Your Registered Mobile Number",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.9),
                      fontFamily: 'RobotRegular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text('+91',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "RobotRegular",
                          )),
                      const SizedBox(width: 40),
                      Expanded(
                        child: TextFormField(
                          controller: _mobileController,
                          maxLength: 12,
                          textInputAction: TextInputAction.next,
                          style: AppFont.NUNITO_REGULAR_BLACK_18,
                          keyboardType: TextInputType.number,
                          focusNode: _mobileFocus,
                          onFieldSubmitted: (term) {
                            _mobileFocus.unfocus();
                            // FocusScope.of(context).requestFocus(_emailFocus);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            counterText: "",
                            hintText: 'Mobile Number',
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        width: 50,
                        height: 1.5,
                      ),
                      const SizedBox(width: 15),
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
                          onPressed: _callSendOtp,
                          child: Text(
                            'SEND OTP',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(1.0),
                                fontFamily: 'RobotRegular'),
                          )),
                    ),
                  ),
                  onTap: _callSendOtp,
                  // onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => ForgotEmailOtpVerify(
                    //           otpSession: "",
                    //           mobile: _mobileController.text,
                    //           userToken: '',
                    //         )));
                  //   setState(() {
                  //     mobileNumber = _mobileController.text;
                  //   });
                  //   setState(() {});
                  // },
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

  _callSendOtp() async {
    if (_mobileController.text.length < 10) {
      Fluttertoast.showToast(msg: 'Mobile Number must contain 10 digit');
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> body = {
          APPStrings.paramMobile: _mobileController.text,
        };

        mAuthProvider!.sendOtpForgot(body).then((value) {
          print(value);
          if (value != null) {
            try {
              if (value["response"] != null && value["response"] == "success") {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => SellerOtpVerifyScreen(
                //           otpSession: value["results"]["OTPSession"],
                //           mobile: _mobileController.text,
                //         )));
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ForgotEmailOtpVerify(
                              otpSession: value["results"]["OTPSession"],
                              mobile: _mobileController.text,
                              userToken: value["results"]["user_token"],
                            )));
                setState(() {
                  mobileNumber = _mobileController.text;
                });
                setState(() {});
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
