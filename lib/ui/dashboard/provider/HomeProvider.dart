import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sb_portal/service/network_repository.dart' as api;
import 'package:sb_portal/utils/app_string.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext? mContext;
  bool isRequestSend = false;

  HomeProvider(context) {
    mContext = context;
  }

  Future<Map<String, dynamic>> productList(String sellerId) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(
            mContext!, APPStrings.apiGetProduct + '/' + sellerId)
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

  Future<Map<String, dynamic>> productListWithSellerId(int id) {
    isRequestSend = true;
    notifyListeners();
    String url = APPStrings.apiGetProduct + "?category=$id";
    return api.callGetMethodToken(mContext!, url).then((value) {
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

  Future<Map<String, dynamic>> productListWithOutSellerId() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiGetProduct)
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

  Future<Map<String, dynamic>> searchProductListFromString(
      String searchProductName) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(
            mContext!, APPStrings.apiGetProduct + "?search=$searchProductName")
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

  Future<Map<String, dynamic>> sliders() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiSliders)
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

  Future<Map<String, dynamic>> addProduct(
      Map<String, String> params, List<String> listOfImage) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithMultipleImage(
            mContext!, APPStrings.apiAddProduct, params, listOfImage)
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

  Future<Map<String, dynamic>> editProduct(
      Map<String, String> params, List<String> listOfImage) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithMultipleImage(
            mContext!, APPStrings.apiEditProduct, params, listOfImage)
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

  Future<Map<String, dynamic>> deleteProduct(String id) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithToken(
        mContext!, APPStrings.apiDeleteProduct + '/' + id, {}).then((value) {
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

  Future<Map<String, dynamic>> getUserProfile() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiUserProfile)
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

  Future<Map<String, dynamic>> getUserPlan() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiUserPlan)
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

  Future<Map<String, dynamic>> getProductCategory() {
    isRequestSend = true;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiGetProductCategory)
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

  Future<Map<String, dynamic>> editProfile(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiUpdateProfile, params)
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

  Future<Map<String, dynamic>> contactNow(Map<String, String> params) {
    isRequestSend = true;
    notifyListeners();
    return api
        .callPostMethodWithToken(mContext!, APPStrings.apiClickProduct, params)
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

  Future<Map<String, dynamic>> getNotification(bool isRequestSend) {
    isRequestSend = isRequestSend;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!, APPStrings.apiGetNotification)
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

  Future<Map<String, dynamic>> readNotification(int notificationId) {
    isRequestSend = false;
    notifyListeners();
    return api
        .callGetMethodToken(mContext!,
            APPStrings.apiReadNotification + "?notification_id=$notificationId")
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
