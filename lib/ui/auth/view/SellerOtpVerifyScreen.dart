import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/auth/view/SelectPlanScreen.dart';
import 'package:sb_portal/ui/auth/view/SellerSignUpScreen.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerHomeScreenNavigation.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class SellerOtpVerifyScreen extends StatefulWidget {
  bool? isFromSeller;
  final String otpSession;
  final String mobile;

  SellerOtpVerifyScreen({Key? key, this.isFromSeller, required this.otpSession, required this.mobile}) : super(key: key);

  @override
  _SellerOtpVerifyScreenState createState() => _SellerOtpVerifyScreenState();
}

class _SellerOtpVerifyScreenState extends State<SellerOtpVerifyScreen> {
  AuthProvider? mAuthProvider;

  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  final TextEditingController _otpController = TextEditingController();
  String? smsOTP;

  late Timer _timer;
  int _start = 90;
  String _timerStart = "01:30";
  bool isResend = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isResend = true;
          });
        } else {
          if (_start > 70) {
            setState(() {
              _start--;
              int temp = _start - 60;
              _timerStart = "01:" + temp.toString();
            });
          } else if (_start > 60) {
            setState(() {
              _start--;
              int temp = _start - 60;
              _timerStart = "01:0" + temp.toString();
            });
          } else if (_start > 10) {
            setState(() {
              _start--;
              _timerStart = "00:" + _start.toString();
            });
          } else {
            setState(() {
              _start--;
              _timerStart = "00:0" + _start.toString();
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mAuthProvider = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: mAuthProvider!.isRequestSend,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    APPImages.icSplashLogo,
                    width: 163,
                    height: 163,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'VERIFY DETAILS',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_24,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Verify Your Mobile Number for\nVerify Details",
                    style: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                        child: PinCodeTextField(
                          appContext: context,
                          textStyle: const TextStyle(
                            color: AppColors.colorBlack,
                          ),
                          showCursor: false,
                          length: 6,
                          blinkWhenObscuring: true,
                          hintCharacter: "0",
                          hintStyle: AppFont.ROBOT_REGULAR_BLACK_14,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(1),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor: AppColors.colorWhite,
                              activeColor: AppColors.colorWhite,
                              selectedFillColor: AppColors.colorWhite,
                              selectedColor: AppColors.colorWhite,
                              inactiveFillColor: AppColors.colorWhite,
                              inactiveColor: AppColors.colorWhite),
                          autoFocus: true,
                          cursorColor: AppColors.colorBrown,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          boxShadows: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 0.5,
                            )
                          ],
                          onCompleted: (v) {
                            print("Completed $v");
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              smsOTP = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          },
                        )),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(_timerStart, style: AppFont.NUNITO_REGULAR_BLACK_18)],
                  ),
                  Text('(OTP Waiting Time)', style: AppFont.NUNITO_REGULAR_BLACK_14),
                  const SizedBox(height: 40),
                  InkWell(
                    child: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.colorOrange,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: MaterialButton(onPressed: null, child: Text('VERIFY NOW', style: AppFont.NUNITO_BOLD_WHITE_24)),
                      ),
                    ),
                    onTap: () {
                      if (smsOTP == null || smsOTP!.length < 4) {
                        Fluttertoast.showToast(msg: 'Please enter otp');
                      } else if (_otpController.text.toString().trim().length < 4) {
                        Fluttertoast.showToast(msg: 'Please enter valid otp');
                      } else {
                        callVerifyOtp();
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not Received?',
                        textAlign: TextAlign.start,
                        style: AppFont.NUNITO_REGULAR_BLACK_14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          _otpController.clear();
                          if (isResend) {
                            setState(() {
                              _start = 30;
                              isResend = false;
                            });
                            startTimer();
                          }
                        },
                        child: Text(
                          ' Resend',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'NunitoSemiBold',
                            color: isResend ? AppColors.colorBrown : AppColors.colorLightBrown,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  callVerifyOtp() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramOtp: smsOTP!,
        "session_id": widget.otpSession,
      };

      mAuthProvider!.verifyOtp(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              CommonModel commonModel = CommonModel.fromJson(value);
              Fluttertoast.showToast(msg: commonModel.message!);

              NavKey.navKey.currentState!.push(MaterialPageRoute(
                  builder: (_) => SellerSignUpScreen(
                        isFromSeller: sellerLogin,
                        mobileNumber: widget.mobile,
                      )));
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

  @override
  void dispose() {
    errorController.close();
    try {
      _timer.cancel();
    } catch (e) {}
    super.dispose();
  }
}
