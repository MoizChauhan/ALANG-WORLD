import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/model/SignUpModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/dashboard/model/CityModel.dart';
import 'package:sb_portal/ui/dashboard/model/CountryModel.dart';
import 'package:sb_portal/ui/dashboard/model/MyProfileModel.dart';
import 'package:sb_portal/ui/dashboard/model/StateModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:sb_portal/utils/common/EmailValidator.dart';

class BuyerEditProfileScreen extends StatefulWidget {
  final MyProfileModel? myProfileModel;

  const BuyerEditProfileScreen({Key? key, this.myProfileModel}) : super(key: key);

  @override
  _BuyerEditProfileScreenState createState() => _BuyerEditProfileScreenState();
}

class _BuyerEditProfileScreenState extends State<BuyerEditProfileScreen> {
  HomeProvider? mHomeProvider;
  AuthProvider? mAuthProvider;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _companyAddressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _companyAddressFocus = FocusNode();
  final FocusNode _stateFocus = FocusNode();
  final FocusNode _pinCodeFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();

  CountryModel countryModel = CountryModel();
  Countries? selectedCountry;
  StateModel stateModel = StateModel();
  States? selectedState;
  CityModel cityModel = CityModel();
  Cities? selectedCity;
  String? city;
  String? country;
  String? state;

  List<String> genderList = [];
  String? selectGender;

  DateTime selectedDate = DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    callCountryListApi();

    _nameController.text = widget.myProfileModel!.results!.profile!.name ?? "";
    _mobileController.text = widget.myProfileModel!.results!.profile!.mobile ?? "";
    _emailController.text = widget.myProfileModel!.results!.profile!.email ?? "";
    _companyAddressController.text = widget.myProfileModel!.results!.profile!.address ?? "";
    _pinCodeController.text = widget.myProfileModel!.results!.profile!.pincode ?? "";
    country = widget.myProfileModel!.results!.profile!.country ?? "";
    state = widget.myProfileModel!.results!.profile!.state ?? "";
    city = widget.myProfileModel!.results!.profile!.district ?? "";
    _dateOfBirthController.text = widget.myProfileModel!.results!.profile!.establishment_date ?? "";
    selectGender = widget.myProfileModel!.results!.profile!.gender ?? "";
    genderList.add('Male');
    genderList.add('Female');
    genderList.add('Other');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    mAuthProvider = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: mAuthProvider!.isRequestSend,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
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
                      Text('EDIT PROFILE', style: AppFont.NUNITO_SEMI_BOLD_BLACK_24),
                      const SizedBox(width: 16),
                      Image.asset(
                        APPImages.icSplashLogo,
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _nameController,
                    "Contact person name",
                    false,
                    _nameFocus,
                    _mobileFocus,
                    context,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            '+91',
                            style: AppFont.NUNITO_REGULAR_BLACK_14,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            color: AppColors.colorBtnBlack,
                            width: 32,
                            height: 1,
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _mobileController,
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          style: AppFont.NUNITO_REGULAR_BLACK_14,
                          keyboardType: TextInputType.number,
                          focusNode: _mobileFocus,
                          onFieldSubmitted: (term) {
                            _mobileFocus.unfocus();
                            FocusScope.of(context).requestFocus(_emailFocus);
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            counterText: "",
                            hintText: 'Mobile number',
                            hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _emailController,
                    "Email Address",
                    false,
                    _emailFocus,
                    _companyAddressFocus,
                    context,
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _companyAddressController,
                    "Company address",
                    false,
                    _companyAddressFocus,
                    _stateFocus,
                    context,
                  ),
                  const SizedBox(height: 16),
                  countryModel.results != null
                      ? DropdownButton<Countries>(
                          hint: country == null ? const Text("Country") : Text(country!),
                          underline: Container(),
                          isExpanded: true,
                          items: countryModel.results!.countries!.map((Countries value) {
                            return DropdownMenuItem<Countries>(
                              value: value,
                              child: Text(value.name!),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCountry = newValue;
                              country = selectedCountry!.name;
                            });
                            callStateListApi();
                          },
                        )
                      : const SizedBox(),
                  Container(
                    color: AppColors.colorBtnBlack,
                    width: double.maxFinite,
                    height: 1,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            DropdownButton<States>(
                              hint: state == null ? const Text("State") : Text(state!),
                              underline: Container(),
                              isExpanded: true,
                              items: stateModel.results == null
                                  ? []
                                  : stateModel.results!.states!.map((States value) {
                                      return DropdownMenuItem<States>(
                                        value: value,
                                        child: Text(value.name!),
                                      );
                                    }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedState = newValue;
                                  state = selectedState!.name;
                                });
                                callCityListApi();
                              },
                            ),
                            Container(
                              color: AppColors.colorBtnBlack,
                              width: double.maxFinite,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            DropdownButton<Cities>(
                              hint: city == null ? const Text("City") : Text(city!),
                              underline: Container(),
                              isExpanded: true,
                              items: cityModel.results == null
                                  ? []
                                  : cityModel.results!.cities!.map((Cities value) {
                                      return DropdownMenuItem<Cities>(
                                        value: value,
                                        child: Text(value.name!),
                                      );
                                    }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCity = newValue;
                                  city = selectedCity!.name;
                                });
                              },
                            ),
                            Container(
                              color: AppColors.colorBtnBlack,
                              width: double.maxFinite,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AppWidgets.buildInputFieldsWithNumber(
                              _pinCodeController,
                              "Pincode",
                              false,
                              _pinCodeFocus,
                              null,
                              context,
                            ),
                            Container(
                              height: 1,
                              width: double.maxFinite,
                              color: AppColors.colorRequestBtn,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              AppWidgets.buildInputFieldsWithNumber(_dateOfBirthController, "Date of Birth", false, _dobFocus, null, context,
                                  isEnable: false),
                              Container(
                                height: 1,
                                width: double.maxFinite,
                                color: AppColors.colorRequestBtn,
                              )
                            ],
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      DropdownButton<String>(
                        hint: selectGender == null ? const Text('Gender') : Text(selectGender!),
                        underline: Container(),
                        isExpanded: true,
                        items: genderList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectGender = newValue;
                          });
                        },
                      ),
                      Container(
                        color: AppColors.colorBtnBlack,
                        width: double.maxFinite,
                        height: 1,
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
                        child: MaterialButton(onPressed: null, child: Text('UPDATE', style: AppFont.NUNITO_BOLD_WHITE_24)),
                      ),
                    ),
                    onTap: () {
                      isValid();
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateOfBirthController.text = picked.day.toString() + "-" + picked.month.toString() + "-" + picked.year.toString();
      });
    }
  }

  isValid() {
    if (_nameController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter name');
    } else if (_mobileController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter mobile number');
    } else if (_mobileController.text.toString().length < 10) {
      Fluttertoast.showToast(msg: 'Please enter valid mobile number');
    } else if (_emailController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
    } else if (!EmailValidator.validate(_emailController.text.toString().trim())) {
      Fluttertoast.showToast(msg: 'Please enter valid email');
    } else if (_companyAddressController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter company address');
    } else if (country == null) {
      Fluttertoast.showToast(msg: 'Please select country');
    } else if (state == null) {
      Fluttertoast.showToast(msg: 'Please select state');
    } else if (city == null) {
      Fluttertoast.showToast(msg: 'Please select city');
    } else if (_pinCodeController.text.toString().trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter pincode');
    } else if (_pinCodeController.text.toString().length < 6) {
      Fluttertoast.showToast(msg: 'Please enter valid pincode');
    } else if (_dateOfBirthController.text.toString().isEmpty) {
      Fluttertoast.showToast(msg: 'Please select company registration date');
    } else if (selectGender == null) {
      Fluttertoast.showToast(msg: 'Please select gender');
    } else {
      callEditProfile();
    }
  }

  callEditProfile() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramCompany: _nameController.text.toString().trim(),
        APPStrings.paramName: _nameController.text.toString().trim(),
        APPStrings.paramEmail: _emailController.text.toString().trim(),
        APPStrings.paramMobile: _mobileController.text.toString(),
        APPStrings.paramPincode: _pinCodeController.text.toString().trim(),
        APPStrings.paramAddress: _companyAddressController.text.toString().trim(),
        APPStrings.paramDistrict: selectedCity == null ? widget.myProfileModel!.results!.profile!.district! : selectedCity!.name!,
        APPStrings.paramState: selectedState == null ? widget.myProfileModel!.results!.profile!.state! : selectedState!.name!,
        APPStrings.paramCountry: selectedCountry == null ? widget.myProfileModel!.results!.profile!.country! : selectedCountry!.name!,
        APPStrings.paramEstablishmentDate: _dateOfBirthController.text.toString(),
        APPStrings.paramDOb: _dateOfBirthController.text.toString(),
        APPStrings.paramGender: selectGender!,
      };

      mHomeProvider!.editProfile(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "success") {
              Fluttertoast.showToast(msg: streams.message);
              Navigator.pop(context);
            } else {
              SignUpModel signUpModel = SignUpModel.fromJson(value);
              Fluttertoast.showToast(msg: signUpModel.message!);
            }
            /*if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              SignUpModel signUpModel = SignUpModel.fromJson(value);
              Fluttertoast.showToast(msg: signUpModel.message!);
              Navigator.pop(context);
            }*/
          } catch (ex) {
            debugPrint(ex.toString());
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

  callCountryListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      mAuthProvider!.getCountryList().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              countryModel = CountryModel.fromJson(value);
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

  callStateListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {APPStrings.paramCountry: selectedCountry!.name!};
      mAuthProvider!.getStateList(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              stateModel = StateModel.fromJson(value);
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

  callCityListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {APPStrings.paramState: selectedState!.name!};
      mAuthProvider!.getCityList(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              cityModel = CityModel.fromJson(value);
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
