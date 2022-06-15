// To parse this JSON data, do
//
//     final notificationDataModel = notificationDataModelFromJson(jsonString);

import 'dart:convert';

NotificationData notificationDataModelFromJson(String str) =>
    NotificationData.fromJson(json.decode(str));

String notificationDataModelToJson(NotificationData data) =>
    json.encode(data.toJson());

class NotificationData {
  NotificationData({
    this.response,
    this.message,
    this.results,
  });

  String? response;
  String? message;
  Results? results;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        response: json["response"],
        message: json["message"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
        "results": results!.toJson(),
      };
}

class Results {
  Results({
    this.notifications,
  });

  List<Notification>? notifications;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.id,
    this.userId,
    this.notificationTitle,
    this.notificationData,
    this.createdAt,
    this.updatedAt,
    this.isRead,
  });

  int? id;
  String? userId;
  String? notificationTitle;
  String? notificationData;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isRead;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        userId: json["user_id"],
        notificationTitle: json["notification_title"],
        notificationData: json["notification_data"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isRead: json["is_read"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "notification_title": notificationTitle,
        "notification_data": notificationData,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_read": isRead,
      };
}
