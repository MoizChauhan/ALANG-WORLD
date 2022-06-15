import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/helper/FirebaseNotificationHelper.dart';
import 'package:sb_portal/ui/splash/SplashScreen.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_routes.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/preference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHelper.load();
  await Firebase.initializeApp();
  FirebaseNotificationHelper.getInstance().init(handler: firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase .
  /*if (Platform.isAndroid) {
    await Firebase.initializeApp();
  }*/
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
  // FirebaseNotificationHelper.getInstance().showNotification(message);
}

var routes = <String, WidgetBuilder>{
  AppRoutes.ROUTES_SPLASH: (c) => SplashScreen(),
};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Locale _appLocale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
              ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
              ));
    }
    return MultiProvider(
        builder: (context, widget) => MaterialApp(
            navigatorKey: NavKey.navKey,
            locale: _appLocale,
            supportedLocales: const [
              Locale(APPStrings.LANGUAGE_EN, ''), // English
            ],
            theme: ThemeData(primaryColor: Colors.white, unselectedWidgetColor: Colors.grey, highlightColor: Colors.transparent),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.ROUTES_SPLASH,
            routes: routes),
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthProvider(_),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeProvider(_),
          ),
        ]);
  }
}
