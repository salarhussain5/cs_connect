import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // Ask the user for notification permission
  Future<void> requestPermission() async {
    // TODO: implement in Module 6
  }

  // Subscribe to a group topic — phone will receive notifications sent to this topic
  Future<void> subscribeToGroup(String groupId) async {
    // TODO: implement in Module 6
  }

  // Get this device's FCM token — saved to Firestore for targeted notifications
  Future<String?> getToken() async {
    // TODO: implement in Module 6
    return null;
  }
}