import 'package:bKash_flutter/utils/config.dart';

class ApiEndpoints {

  static const String apiUrl = '${AppConfig.baseUrl}/api/v1';
  static Uri auth = Uri.parse('$apiUrl/auth');
  static Uri otpVerify = Uri.parse('$apiUrl/verify-otp');
  static Uri setupProfile = Uri.parse('$apiUrl/setup-profile');
  static Uri user = Uri.parse('$apiUrl/user');

}