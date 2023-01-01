



import 'package:local_notification_package/model/remote_notification_model.dart';

class RemoteMessageModel {
  final String? senderId;
  final String? category;
  final String? collapseKey;
  final bool contentAvailable;
  final Map<String, dynamic> data;
  final String? from;
  final String? messageId;
  final String? messageType;
  final bool mutableContent;
  final DateTime? sentTime;
  final String? threadId;
  final int? ttl;
  final RemoteNotificationModel? notification;

  const RemoteMessageModel(
      {this.senderId,
        this.category,
        this.collapseKey,
        this.contentAvailable = false,
        this.data = const <String, dynamic>{},
        this.from,
        this.messageId,
        this.messageType,
        this.mutableContent = false,
        this.notification,
        this.sentTime,
        this.threadId,
        this.ttl,   });

  factory RemoteMessageModel.fromMap(Map<String, dynamic> map) {
    return RemoteMessageModel(
      senderId: map['senderId'],
      category: map['category'],
      collapseKey: map['collapseKey'],
      contentAvailable: map['contentAvailable'] ?? false,
      data: map['data'] == null
          ? <String, dynamic>{}
          : Map<String, dynamic>.from(map['data']),
      from: map['from'],
      messageId: map['messageId']?.toString(),
      messageType: map['messageType'],
      mutableContent: map['mutableContent'] ?? false,
      notification: map['notification'] == null
          ? null
          : RemoteNotificationModel.fromMap(
          Map<String, dynamic>.from(map['notification'])),

      sentTime: map['sentTime'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['sentTime'].toString())),
      threadId: map['threadId'],
      ttl: map['ttl'],
    );
  }

  /// Returns the [RemoteMessage] as a raw Map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'category': category,
      'collapseKey': collapseKey,
      'contentAvailable': contentAvailable,
      'data': data,
      'from': from,
      'messageId': messageId,
      'messageType': messageType,
      'mutableContent': mutableContent,
      'notification': notification?.toMap(),
      'sentTime': sentTime?.millisecondsSinceEpoch,
      'threadId': threadId,
      'ttl': ttl,
    };
  }


}
