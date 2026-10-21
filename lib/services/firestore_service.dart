import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user profile to Firestore after first login
  Future<void> saveUser(UserModel user) async {
    // TODO: implement in Module 3
  }

  // Get a user's profile from Firestore
  Future<UserModel?> getUser(String uid) async {
    // TODO: implement in Module 3
    return null;
  }

  // Send a message to a group
  Future<void> sendMessage(String groupId, MessageModel message) async {
    // TODO: implement in Module 5 (Group Chat)
  }

  // Stream of messages for a group — real-time
  Stream<List<MessageModel>> getGroupMessages(String groupId) {
    // TODO: implement in Module 5
    return const Stream.empty();
  }

  // Mark a message as important
  Future<void> markAsImportant(String groupId, String messageId) async {
    // TODO: implement in Module 6 (Priority Alert)
  }
}