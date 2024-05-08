import 'package:bKash_flutter/controllers/token_controller.dart';
import 'package:bKash_flutter/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<http.Response> auth({required String phoneNumber}) async {
    return await http.post(
      ApiEndpoints.auth,
      body: {
        'phone_number': phoneNumber,
      },
    );
  }

  static Future<http.Response> verifyOtp({required String otp}) async {
    return await http.post(ApiEndpoints.otpVerify, body: {
      'otp': otp,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': await authToken(),
    });
  }

  static Future<http.Response> sendMoney({
    required String amount,
    required String receiverNumber,
  }) async {
    return await http.post(
      ApiEndpoints.sendMoney,
      body: {
        'amount': amount,
        'receiver_number': receiverNumber,
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.Response> userData() async {
    return await http.get(
      ApiEndpoints.user,
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.Response> transactionHistory () async {
    return await http.get(
      ApiEndpoints.transactionHistory,
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.Response> checkNumber(String number) async {
    return await http.get(
      Uri.parse('${ApiEndpoints.checkNumber}$number'),
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.StreamedResponse> profileSetup({
    required String pin,
    required String fName,
    required String lName,
    required String profilePicture,
  }) async {
    final request = http.MultipartRequest('POST', ApiEndpoints.setupProfile);

    var headers = {
      'Accept': 'application/json',
      'Authorization': await authToken(),
    };

    request.fields.addAll({
      'pin': pin,
      'first_name': fName,
      'last_name': lName,
    });

    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_picture',
        profilePicture,
      ),
    );

    request.headers.addAll(headers);

    final response = await request.send();

    return response;
  }
}
