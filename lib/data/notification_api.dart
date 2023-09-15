import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

  void initialiseNotifications() async {
    InitializationSettings settings = InitializationSettings(
      android: _androidInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(settings);
  }

  void sendNotification(String title, String body) async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channelId', 'channelName',importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
    print("Succesfully Sent");
  }


  void scheduleNotification(String title, String body, tz.TZDateTime notificationTime) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channelId', 'channelName',importance: Importance.max, priority: Priority.high,playSound: true,);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    int id = 5;
    try {

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        notificationTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exact,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'Notification Payload',
      );
    }
    catch(e){
      print(e);
    }
    print("Successfully Scheduled");
  }



}