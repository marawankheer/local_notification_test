

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_package/model/remote_message_model.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

class LocalNotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late final BuildContext context;

  initializeNotification(BuildContext context) async {
    this.context = context;
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    String? payload =
        notificationAppLaunchDetails?.notificationResponse?.payload;
    print('notification payload after termination $payload');

    /// When App Terminated

    if (payload != null) {
      print('notification payload after termination : $payload');
      await Navigator.pushNamed(context, payload);
    }
    var cnf = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        ///When app opened
        print("Called");
        payload = details.payload;
        if (payload != null) {
          print('notification payload: $payload');
          Navigator.pushNamed(context, payload!);
        }
      },
    );
  }

  operateMessage(RemoteMessageModel message) {
    Navigator.pushNamed(context, message.data['screen']);
  }

  Future<void> notificationMessage(var message) async {
    print(
        "message.data['screen'] from local notification ${message.data['screen']}");
    await flutterLocalNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: message.data['screen']);
  }
}
