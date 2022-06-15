import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sb_portal/utils/LifecycleEventHandler.dart';
import 'package:sb_portal/utils/preference_helper.dart';

import '../../utils/NavKey.dart';
import '../dashboard/view/notification.dart';

class FirebaseNotificationHelper {
  // next three lines makes this class a Singleton
  static final FirebaseNotificationHelper _instance = FirebaseNotificationHelper.getInstance();

  factory FirebaseNotificationHelper() => _instance;

  FirebaseNotificationHelper.getInstance();

  static int appStatus = 0; // 0 - foreground , 2 - background , 3 - terminate

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'sb_portal', // id
    'sb_portal', // title
    description: 'sb_portal_description', // description
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getFcmToken() async {
    // use the returned token to send messages to users from your custom server
    return await _firebaseMessaging.getToken();
  }

  Future<void> _saveTokenToPreference(String token) async {
    debugPrint("Refreshed Token: $token");

    PreferenceHelper.setString(PreferenceHelper.FCM_TOKEN, token);
  }

  /// Init method
  init({BackgroundMessageHandler? handler}) async {
    if (handler != null) {
      FirebaseMessaging.onBackgroundMessage(handler);
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    var initializationSettingsAndroid = const AndroidInitializationSettings("app_icon");

    var initializationSettingsIOS = const IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: notificationClick);

    String? token = await _firebaseMessaging.getToken();

    PreferenceHelper.setString(PreferenceHelper.FCM_TOKEN, token!);

    debugPrint("Token: $token");

    _firebaseMessaging.onTokenRefresh.listen(_saveTokenToPreference);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //while app is running in foreground you can get all the notifications here.
      debugPrint("NOTIFICATION" + message.data.toString());
      debugPrint("TYPE : " + message.data["type"].toString());
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //Use FirebaseMessaging.onMessageOpenedApp as a replacement for onLaunch and onResume handlers.
      debugPrint('A new onMessageOpenedApp event was published!');
      debugPrint("NOTIFICATION" + message.data.toString());
      notificationClickIOS(message.data);
    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      //on terminated stage while app is launched by notification you will get the data here
      if (message != null) {
        // if (Platform.isIOS) {
        debugPrint('INITIAL MESSAGE METHOD');
        Future.delayed(const Duration(milliseconds: 1500), () {
          notificationClickIOS(message.data);
        });
        // }
      }
    });
    checkAppState();
  }

  void checkAppState() {
    appStatus = 0;

    WidgetsBinding.instance!.addObserver(LifecycleEventHandler(resumeCallBack: () async {
      appStatus = 0;
      // return ;
    }, pausedCallBack: () async {
      appStatus = 1;
      // return ;
    }, suspendingCallBack: () async {
      appStatus = 2;
      // return ;
    }));
  }

  showNotification(RemoteMessage message) async {
    debugPrint("Message Received -->>" + json.encode(message.data));

    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channel.id,
        _channel.name,
        channelDescription: _channel.description,
        icon: 'app_icon',
        // sound: RawResourceAndroidNotificationSound('notification_sound'),
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        styleInformation: const BigTextStyleInformation(''),
        // other properties...
      ),
      iOS: const IOSNotificationDetails(
        presentSound: true,
        presentAlert: true,
        presentBadge: true,
      ),
    );

    debugPrint("Showing notification with data ${message.data}");
    Map<String, dynamic> data = message.data;

    // flutterLocalNotificationsPlugin.show(Random().nextInt(100), 'SbPortal',
    //     data['message'].toString(), notificationDetails,
    //     payload: json.encode(data));

    RemoteNotification? remoteNotification = message.notification;

    flutterLocalNotificationsPlugin.show(
      remoteNotification.hashCode,
      remoteNotification!.title,
      remoteNotification.body,
      notificationDetails,
      payload: json.encode(data),
    );
  }

  Future notificationClick(String? payload) async {
    debugPrint('CLICK : notification payload: ' + payload!);
    if (payload.isNotEmpty) {
      var data = json.decode(payload);
      debugPrint(data.toString());
    } else {
      debugPrint("payload null");
    }
    NavKey.navKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => const NotificationPage(),
      ),
    );
  }

  Future notificationClickIOS(Map<String, dynamic> payload) async {
    debugPrint('CLICK : notification payload: ' + payload.toString());
    if (payload.isNotEmpty) {
      debugPrint(payload.toString());
    } else {
      debugPrint("payload null");
    }
    NavKey.navKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => const NotificationPage(),
      ),
    );
  }
}
