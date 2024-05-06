import 'package:bKash_flutter/core/services/api_services.dart';
import 'package:bKash_flutter/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var userData = UserModel().obs;

  getUserData () async {
    final response = await ApiServices.userData();

    userData.value = userModelFromJson(response.body);
    update();

    print(userData.value.phoneNumber);

  }

}