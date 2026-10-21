import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;          // Firebase Auth user ID — unique for every user
  final String name;         // Full name from the database
  final String email;        // University email
  final String role;         // 'student' or 'teacher'
  final int semester;        // 1 to 8 for students, 0 for teachers
  final String gender;       // 'male' or 'female'
  final String groupId;      // which Firestore group they belong to
  final String profilePicUrl; // Firebase Storage download URL (empty string if no pic)
  final String fcmToken;     // for push notifications (updated on every login)
  final DateTime createdAt;  // when they first signed in

  // Constructor — creates a UserModel object with all required fields
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.semester,
    required this.gender,
    required this.groupId,
    this.profilePicUrl = '',   // default empty string (no picture yet)
    this.fcmToken = '',
    required this.createdAt,
  });

  // fromMap — converts a Firestore document into a UserModel object
  // Firestore gives us a Map<String, dynamic>, this turns it into a proper object
  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'student',
      semester: map['semester'] ?? 0,
      gender: map['gender'] ?? '',
      groupId: map['groupId'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
      // Firestore stores dates as Timestamp — we convert to Dart DateTime
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // toMap — converts a UserModel object into a Map for saving to Firestore
  // Firestore expects Map<String, dynamic>, not a Dart object
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'semester': semester,
      'gender': gender,
      'groupId': groupId,
      'profilePicUrl': profilePicUrl,
      'fcmToken': fcmToken,
      // We use FieldValue.serverTimestamp() so Firestore records
      // the exact server time, not your phone's clock
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // copyWith — creates a new UserModel with some fields changed
  // We never mutate (change) the original object — we make a copy instead
  // This is the Flutter way of updating state safely
  UserModel copyWith({
    String? name,
    String? profilePicUrl,
    String? fcmToken,
    String? groupId,
  }) {
    return UserModel(
      uid: uid,
      name: name ?? this.name,           // if name is given use it, else keep original
      email: email,
      role: role,
      semester: semester,
      gender: gender,
      groupId: groupId ?? this.groupId,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt,
    );
  }

  // Helper getters — computed properties based on existing fields
  bool get isTeacher => role == 'teacher';
  bool get isStudent => role == 'student';
  bool get hasProfilePic => profilePicUrl.isNotEmpty;

  @override
  String toString() => 'UserModel(uid: $uid, name: $name, role: $role)';
}