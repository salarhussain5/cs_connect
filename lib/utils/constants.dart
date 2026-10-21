import 'package:flutter/material.dart';

// ─── App Colors ───────────────────────────────────────────────────────────────
// We define colors here once. Every screen uses these.
// If you want to change the app color later, change it here — done everywhere.
class AppColors {
  static const Color primary = Color(0xFF1565C0);       // main blue
  static const Color primaryLight = Color(0xFF1E88E5);  // lighter blue
  static const Color primaryDark = Color(0xFF0D47A1);   // darker blue
  static const Color white = Colors.white;
  static const Color background = Color(0xFFF7F8FA);    // page background
  static const Color surface = Colors.white;             // card background
  static const Color textPrimary = Color(0xFF1A1A1A);   // main text
  static const Color textSecondary = Color(0xFF888888); // muted text
  static const Color error = Color(0xFFE53935);         // red errors
  static const Color success = Color(0xFF2E7D32);       // green success
  static const Color important = Color(0xFFF57C00);     // orange important
}

// ─── Group IDs ─────────────────────────────────────────────────────────────
// These are the exact Firestore document IDs for your 8 groups.
// The function below builds the correct ID from semester + gender.
class AppGroups {

  // Builds a group ID from semester and gender
  // Example: getGroupId(3, 'male') returns 'semester3_boys'
  static String getGroupId(int semester, String gender) {
    final suffix = gender == 'male' ? 'boys' : 'girls';
    return 'semester${semester}_$suffix';
  }

  // Builds a readable group name from the ID
  // Example: getGroupName('semester3_boys') returns 'Semester 3 Boys'
  static String getGroupName(String groupId) {
    // groupId looks like 'semester3_boys'
    final parts = groupId.split('_');       // ['semester3', 'boys']
    final semPart = parts[0];              // 'semester3'
    final genderPart = parts[1];           // 'boys'
    final semNum = semPart.replaceAll('semester', ''); // '3'
    final gender = genderPart == 'boys' ? 'Boys' : 'Girls';
    return 'Semester $semNum $gender';     // 'Semester 3 Boys'
  }

  // All 8 group IDs — useful when we create groups in Firestore
  static const List<String> allGroupIds = [
    'semester1_boys', 'semester1_girls',
    'semester2_boys', 'semester2_girls',
    'semester3_boys', 'semester3_girls',
    'semester4_boys', 'semester4_girls',
    'semester5_boys', 'semester5_girls',
    'semester6_boys', 'semester6_girls',
    'semester7_boys', 'semester7_girls',
    'semester8_boys', 'semester8_girls',
  ];
}

// ─── FastAPI Server URL ────────────────────────────────────────────────────
// Change this URL when you deploy to Railway in Module 2
class AppConfig {
  static const String apiBaseUrl = 'http://127.0.0.1:8000'; // local testing
  // When Railway is set up, change to: 'https://your-app.railway.app'
}