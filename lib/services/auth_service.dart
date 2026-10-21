import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the currently logged-in user (null if not logged in)
  User? get currentUser => _auth.currentUser;

  // Stream that emits whenever login state changes
  // Riverpod will listen to this stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Login with email and password
  Future<UserCredential> login(String email, String password) async {
    // TODO: implement in Module 3 (Day 9-18)
    throw UnimplementedError();
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Change password
  Future<void> changePassword(String newPassword) async {
    // TODO: implement in Module 3
    throw UnimplementedError();
  }
}