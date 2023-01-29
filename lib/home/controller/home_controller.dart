import 'package:appd/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HomeController extends GetxController {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  getDefaultDialogFor() {
    Get.defaultDialog(
        title: "Exit",
        content: Center(
            child: Text(
          "Do you want Exit App ?",
          style: TextStyle(fontSize: 25),
        )),
        confirm: TextButton(
            onPressed: () {
              getNotifications();
              Get.back();
              SystemNavigator.pop();
            },
            child: Text("Ok")));
  }

  getNotifications() {
    initNotifications();
    showNotification(
      title: "App_C",
      body: "",
    );
  }

  showNotification(
      {int id = 0, String? title, String? body, String? pyload}) async {
// ignore: prefer_const_constructors
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
      await _notificationDetails(),
      payload: pyload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        icon: "@mipmap/launcher_icon",
        priority: Priority.high,
      ),
      //iOS: IOSNotificationDetails(),
    );
  }

  initNotifications() async {
    print("ww");
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    // ignore: prefer_const_declarations
    final InitializationSettings initializationSettings =
        const InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
        SystemNavigator.selectMultiEntryHistory();
    });
  }
}
