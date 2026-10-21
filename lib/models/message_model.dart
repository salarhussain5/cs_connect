import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;    // Firestore document ID (auto-generated)
  final String text;         // the message content
  final String senderUID;    // who sent it
  final String senderName;   // their display name
  final String senderRole;   // 'student' or 'teacher' (for the Teacher badge)
  final DateTime timestamp;  // when it was sent
  final bool isImportant;    // false by default, true when Priority Alert is pressed
  final List<String> acknowledgedBy; // list of UIDs who pressed "Got it ✓"

  const MessageModel({
    required this.messageId,
    required this.text,
    required this.senderUID,
    required this.senderName,
    required this.senderRole,
    required this.timestamp,
    this.isImportant = false,          // default: not important
    this.acknowledgedBy = const [],    // default: no acknowledgements yet
  });

  factory MessageModel.fromMap(Map<String, dynamic> map, String messageId) {
    return MessageModel(
      messageId: messageId,
      text: map['text'] ?? '',
      senderUID: map['senderUID'] ?? '',
      senderName: map['senderName'] ?? '',
      senderRole: map['senderRole'] ?? 'student',
      timestamp: (map['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isImportant: map['isImportant'] ?? false,
      // Firestore stores arrays as List<dynamic> — we cast to List<String>
      acknowledgedBy: List<String>.from(map['acknowledgedBy'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderUID': senderUID,
      'senderName': senderName,
      'senderRole': senderRole,
      'timestamp': FieldValue.serverTimestamp(),
      'isImportant': isImportant,
      'acknowledgedBy': acknowledgedBy,
    };
  }

  // Helper getters
  bool get isFromTeacher => senderRole == 'teacher';
  bool get hasAcknowledgements => acknowledgedBy.isNotEmpty;
  int get acknowledgementCount => acknowledgedBy.length;

  // Check if a specific user has already acknowledged
  bool isAcknowledgedBy(String uid) => acknowledgedBy.contains(uid);

  @override
  String toString() =>
      'MessageModel(id: $messageId, from: $senderName, important: $isImportant)';
}
