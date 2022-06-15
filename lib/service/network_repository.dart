import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginNavigation.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/common/Unauthorised.dart';
import 'package:sb_portal/utils/preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future callGetMethod(BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  try {
    commonHeaders.remove('Authorization');
  } catch (e) {
    debugPrint(e.toString());
  }
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("timezone--" + _timezone);

  return await http
      .get(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callGetMethodToken(BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);

  return await http
      .get(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callGetMethodWithOutToken(BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;

  printWrapped("baseUrl--" + APPStrings.baseUrl + url);

  return await http
      .get(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callDeleteMethodToken(BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);

  return await http
      .delete(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
  /* return await http
      .get(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });*/
}

Future callPostMethod(
    BuildContext mContext, String url, Map<String, dynamic> params) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  try {
    commonHeaders.remove('Authorization');
  } catch (e) {
    debugPrint(e.toString());
  }
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--body-" + params.toString());

  return await http
      .post(Uri.parse(APPStrings.baseUrl + url),
          body: params, headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPostMethodWithToken(
    BuildContext mContext, String url, Map<String, dynamic> params) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--body-" + params.toString());
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .post(Uri.parse(APPStrings.baseUrl + url),
          body: params, headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPostMethodWithTokenWithoutParam(
    BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .post(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPostMethodWithTokenWithOutParam(
    BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  // printWrapped("baseUrl--body-" + params.toString());
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .post(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPutMethodWithToken(
    BuildContext mContext, String url, Map<String, dynamic> params) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--body-" + params.toString());
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .put(Uri.parse(APPStrings.baseUrl + url),
          body: params, headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPutMethodWithTokenWithOutBody(
    BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .put(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callDeleteMethodWithToken(BuildContext mContext, String url) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  return await http
      .delete(Uri.parse(APPStrings.baseUrl + url), headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

clearData() async {
  PreferenceHelper.clear();
  NavKey.navKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (_) => WithOutLoginNavigation(
                selectedIndex: 0,
              )),
      (route) => false);
}

Future callPostMethodWithImage(BuildContext mContext, String url,
    Map<String, String> params, String image) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;

  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--body-" + params.toString());
  var request =
      http.MultipartRequest('POST', Uri.parse(APPStrings.baseUrl + url));
  request.files.add(await http.MultipartFile.fromPath("profile", image));
  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future callPostMethodWithMultipleImage(BuildContext mContext, String url,
    Map<String, String> params, List<String> listOfImage) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("Header--" + commonHeaders.toString());
  printWrapped("baseUrl--body-" + params.toString());
  var request =
      http.MultipartRequest('POST', Uri.parse(APPStrings.baseUrl + url));
  for (int i = 0; i < listOfImage.length; i++) {
    request.files.add(
        await http.MultipartFile.fromPath("image${i + 1}", listOfImage[i]));
  }
  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future callPutMethodWithTokenWithOutImageWithModel(
    BuildContext mContext, String url, dynamic params) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  printWrapped(
      "Bearer--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
  printWrapped("baseUrl--" + APPStrings.baseUrl + url);
  printWrapped("baseUrl--body-" + json.encode(params));
  printWrapped("baseUrl--commonHeaders-" + commonHeaders.toString());

  var body = json.encode(params);

  return await http
      .put(Uri.parse(APPStrings.baseUrl + url),
          body: body, headers: commonHeaders)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPostMethodWithVideoWithToken(BuildContext mContext, String url,
    Map<String, String> params, String video) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  if (kDebugMode) {
    print("baseUrl--" + APPStrings.baseUrl + url);
    print("baseUrl--body-" + params.toString());
  }
  var request =
      http.MultipartRequest('POST', Uri.parse(APPStrings.baseUrl + url));
  request.files.add(await http.MultipartFile.fromPath("files", video));
  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future callPostMethodWithImageWithToken(BuildContext mContext, String url,
    Map<String, String> params, String image) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  if (kDebugMode) {
    print("baseUrl--" + APPStrings.baseUrl + url);
    print("baseUrl--body-" + params.toString());
  }
  var request =
      http.MultipartRequest('POST', Uri.parse(APPStrings.baseUrl + url));
  request.files.add(await http.MultipartFile.fromPath("profile", image));
  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future callPutMethodWithImageWithToken(BuildContext mContext, String url,
    Map<String, String> params, String image) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  if (kDebugMode) {
    print("baseUrl--" + APPStrings.baseUrl + url);
    print("token--" + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN));
    print("baseUrl--body-" + params.toString());
  }
  var request =
      http.MultipartRequest('PUT', Uri.parse(APPStrings.baseUrl + url));
  request.files.add(await http.MultipartFile.fromPath("image", image));
  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future callPostMethodWithMultiImageWithToken(BuildContext mContext, String url,
    Map<String, String> params, List<File> image) async {
  String _timezone = await FlutterNativeTimezone.getLocalTimezone();
  commonHeaders['timezone'] = _timezone;
  commonHeaders['Authorization'] =
      "Bearer " + PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN);

  if (kDebugMode) {
    print("baseUrl--" + APPStrings.baseUrl + url);
    print("baseUrl--body-" + params.toString());
  }
  var request =
      http.MultipartRequest('POST', Uri.parse(APPStrings.baseUrl + url));

  if (image.isNotEmpty) {
    for (int i = 0; i < image.length; i++) {
      if (kDebugMode) {
        print("baseUrl--body-images[$i]");
      }
      request.files
          .add(await http.MultipartFile.fromPath("files[$i]", image[i].path));
    }
  }

  request.headers.addAll(commonHeaders);
  request.fields.addAll(params);
  var streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  return getResponse(response);
}

Future<String> post(String url, {headers, body, encoding}) async {
  Map<String, String> defaultHeaders = _initHeaders(headers);

  printWrapped('Request POST: Url[$url]');
  printWrapped('Request Body = ${json.encode(body)}');
  printWrapped('Request Headers = [$defaultHeaders]\nEncoding[$encoding]}');

  return responseHandler(await http.post(Uri.parse(APPStrings.baseUrl + url),
      body: json.encode(body), headers: defaultHeaders, encoding: encoding));
}

Map<String, String> _initHeaders(Map<String, String>? headers,
    {bool isMultiPart = false}) {
  Map<String, String> defaultHeaders = {};

  if (!isMultiPart) {
    defaultHeaders.addAll({
      'Content-type': 'application/json',
      'Accept-app-version': '1.0.0',
    });
  }

  if (headers != null) {
    defaultHeaders.addAll(headers);
    return defaultHeaders;
  }

  String token =
      PreferenceHelper.getString(PreferenceHelper.AUTH_TOKEN, def: "");
  if (token.isNotEmpty) {
    defaultHeaders['Authorization'] = "Bearer " + token;
  }

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  prefs.then((pref) {
    try {
      String token = pref.getString(PreferenceHelper.AUTH_TOKEN)!;
    } catch (e) {
      debugPrint(e.toString());
    }
  });

  return defaultHeaders;
}

Future<String> responseHandler(http.Response response) async {
  final String res = response.body;
  printWrapped('RESPONSE =' +
      response.statusCode.toString() +
      " " +
      response.request.toString());
  printWrapped('RESPONSE =' + res);
  final int statusCode = response.statusCode;
  String errorMessage = "";

  // MyApp.alice.onHttpResponse(response);

  if (statusCode == 200) {
    // Success

    return res;
  } else if (statusCode == 425) {
    // Success
    return res;
  } else if (statusCode == 401) {
    clearData();
    CommonModel errorResponse = CommonModel();
    errorResponse.response = statusCode;
    errorResponse.message = errorMessage;

    throw (jsonEncode(errorResponse));
  } else if (statusCode == 400) {
    CommonModel errorResponse = CommonModel();
    errorResponse.response = statusCode;
    errorResponse.message = errorMessage;

    throw (jsonEncode(errorResponse));
  } else if (statusCode == 204) {
    CommonModel errorResponse = CommonModel();
    errorResponse.response = statusCode;
    errorResponse.message = errorMessage;

    throw (jsonEncode(errorResponse));
  } else {
    try {
      final body = json.decode(response.body);
      errorMessage = body['message'];
      CommonModel errorResponse = CommonModel();
      errorResponse.response = statusCode;
      if (errorMessage == null || errorMessage.isEmpty) {
        errorResponse.message = APPStrings.INTERNAL_SERVER_ISSUE;
      } else {
        errorResponse.message = errorMessage;
      }
      throw (jsonEncode(errorResponse));
    } catch (e) {
      if (e.toString().isEmpty) {
        CommonModel errorResponse = CommonModel();
        errorResponse.response = statusCode;
        errorResponse.message = APPStrings.INTERNAL_SERVER_ISSUE;
        throw (jsonEncode(errorResponse));
      } else {
        throw (e.toString());
      }
    }
  }
}

Future getResponse(Response response) async {
  final int statusCode = response.statusCode;
  printWrapped("response--statusCode--" + response.statusCode.toString());
  printWrapped("response--" + response.body);
  if (statusCode == 500) {
    return "{\"status\":\"0\",\"message\":\"${APPStrings.INTERNAL_SERVER_ISSUE}\"}";
  } else if (statusCode == 401) {
    Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
    clearData();
    return "{\"status\":\"0\",\"message\":\"${streams.message}\"}";
  } else if (statusCode == 400) {
    CommonModel streams = CommonModel.fromJson(json.decode(response.body));
    return "{\"status\":\"0\",\"message\":\"${streams.message}\"}";
  } else if (statusCode < 200 || statusCode > 404) {
    String error = response.headers['message'].toString();
    printWrapped("response--" + error);
    return "{\"status\":\"0\",\"message\":\"$error\"}";
  }
  return response.body;
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Map<String, String> commonHeaders = {
  'Accept': 'application/json',
  'deviceType': Platform.isIOS ? '2' : '1',
  'lancode': 'en',
  "platform": Platform.operatingSystem,
  "appversion": "1.0.1",
};

String liveImage() {
  return "https://picsum.photos/500/500?random=3";
}

String randomImage() {
  var rng = Random();
  return "https://picsum.photos/500/500?random=" + rng.nextInt(500).toString();
}

bool validatePhone(String data) =>
    RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(data);
