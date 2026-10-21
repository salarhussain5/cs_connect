import 'package:dio/dio.dart';
import '../utils/constants.dart';

class ApiService {
  // Dio is configured with your server base URL
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

  // Verify student against the SQLite students table
  // Returns a Map with exists, name, semester, gender
  // Returns null if the server is offline or student not found
  Future<Map<String, dynamic>?> verifyStudent(String email) async {
    // TODO: implement in Module 2 (Day 4-8)
    return null;
  }

  // Verify teacher against the SQLite teachers table
  Future<Map<String, dynamic>?> verifyTeacher(String email) async {
    // TODO: implement in Module 2 (Day 4-8)
    return null;
  }
}