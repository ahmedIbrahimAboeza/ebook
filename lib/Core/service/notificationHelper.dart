// ignore: file_names
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  static init() async {
    awesomeNotifications.initialize('resource://drawable/notification', [
      // notification icon
      NotificationChannel(
        channelGroupKey: 'basic_test',
        channelKey: 'basic',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),

      NotificationChannel(
          channelGroupKey: 'image_test',
          channelKey: 'image',
          channelName: 'image notifications',
          channelDescription: 'Notification channel for image tests',
          defaultColor: Colors.redAccent,
          ledColor: Colors.white,
          channelShowBadge: true,
          importance: NotificationImportance.High)

      //add more notification type with different configuration
    ]);
  }

  // ignore: non_constant_identifier_names
  static Create() async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      //show notification
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        //simgple notification
        id: 122,
        channelKey: 'basic', //set configuration wuth key "basic"
        title: 'Welcome to FlutterCampus.com',
        body: 'This simple notification is from Flutter App',
      ));
    }
  }
}
