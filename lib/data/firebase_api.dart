import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> setupFirebaseMessaging() async {
    // Request notification permission
    await requestNotificationPermission();
    // Listen to incoming messages and handle them
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages here
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print("Notification permission status: ${settings.authorizationStatus}");
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // Handle background messages here
  }
}
