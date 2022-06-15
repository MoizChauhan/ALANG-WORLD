import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sb_portal/service/network_repository.dart' as api;
import 'package:sb_portal/utils/app_string.dart';

class AuthProvider extends ChangeNotifier {
  BuildContext? mContext;
  bool isRequestSend = false;

  AuthProvider(context) {
    mContext = context;
  }

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethod(mContext!, APPStrings.apiRegister, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> sendOtp(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethod(mContext!, APPStrings.sendOtp, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethod(mContext!, APPStrings.forgotPassword, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiVerifyOtp, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethod(mContext!, APPStrings.apiLogin, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> planList() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiGetPlan)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> selectPlan(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiSelectPlan, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getCountryList() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiCountriesList)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getStateList(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiStateList, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getCityList(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiCitiesList, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiChangePassword, params)
        .then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }
}
