import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  // This line must be first — it initialises Flutter before anything else
  WidgetsFlutterBinding.ensureInitialized();

  // This connects your app to Firebase using the firebase_options.dart file
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ProviderScope wraps the whole app — required for Riverpod to work
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS Connect',
      debugShowCheckedModeBanner: false, // removes the red DEBUG banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // blue color for the whole app
        ),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

// Temporary home screen — just to confirm everything is working today
// You will replace this tomorrow with the real splash screen
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1565C0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_rounded,
              size: 90,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'CS Connect',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Department Communication Platform',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Day 1 Complete ✅',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}