import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:comsphere/pages/fitur_1.dart';
import 'package:comsphere/pages/fitur_2.dart';
import 'package:comsphere/pages/fitur_3.dart';
import 'package:flutter/material.dart';

void main() async {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification channel for basic tests',
      defaultColor: Colors.blue,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
  ]);

  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Fitur1());
  }
}
