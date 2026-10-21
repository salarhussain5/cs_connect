import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  // This function runs as soon as the splash screen opens
  void _navigate() async {

    // Wait 2 seconds so the user can see the splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if user is already logged in from before
    final user = FirebaseAuth.instance.currentUser;

    // mounted check — makes sure the screen is still on screen before navigating
    if (!mounted) return;

    if (user != null) {
      // User is already logged in — skip the login screen
      // For now we still go to login since home is not built yet
      // We will change this to HomeScreen when we build it later
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      // User is not logged in — show login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1565C0), // deep blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // App icon inside a white rounded box
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.school_rounded,
                size: 62,
                color: Color(0xFF1565C0),
              ),
            ),

            const SizedBox(height: 28),

            // App name
            const Text(
              'CS Connect',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 8),

            // College name
            const Text(
              'Government College No. 1, D.I. Khan',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 70),

            // Loading spinner at bottom
            const SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}