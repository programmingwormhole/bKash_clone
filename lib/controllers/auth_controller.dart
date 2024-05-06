import 'dart:convert';
import 'dart:io';

import 'package:bKash_flutter/controllers/home_controller.dart';
import 'package:bKash_flutter/core/services/api_services.dart';
import 'package:bKash_flutter/core/services/shared_services.dart';
import 'package:bKash_flutter/models/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../routes/route_names.dart';

class AuthController extends GetxController {
  RxString number = RxString('');

  RxString otp = RxString('');

  RxString pin = RxString('');

  RxString fName = RxString('');

  RxString lName = RxString('');

  File? profilePicture;

  final homeController = Get.put(HomeController());

  Future auth() async {
    final response = await ApiServices.auth(
      phoneNumber: number.value,
    );

    if (response.statusCode != 200) {
      // Error
      return Get.snackbar('Error', 'Something is wrong');
    }

    print(response.body);

    final decoded = jsonDecode(response.body);

    SharedServices.setData(SetType.string, 'token', decoded['token']);

    Get.toNamed(RouteNames.otp);
  }

  Future verifyOtp() async {
    final response = await ApiServices.verifyOtp(
      otp: otp.value,
    );

    final decode = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return Get.snackbar('Error', decode['message']);
    }

    print(response.body);

    if (decode['state'] == 'login') {
      final response = await ApiServices.userData();

      homeController.userData.value = userModelFromJson(response.body);
      update();

    }

    return Get.toNamed(
      RouteNames.pin,
      arguments: {
        'state': decode['state'],
      },
    );
  }

  Future setupProfile() async {
    final response = await ApiServices.profileSetup(
      pin: pin.value,
      fName: fName.value,
      lName: lName.value,
      profilePicture: profilePicture!.path,
    );

    if (response.statusCode != 200) {
      print(response.reasonPhrase);
      return Get.snackbar('Error', 'Something is wrong');
    }

    print(await response.stream.bytesToString());

    Get.offAllNamed(RouteNames.home);
  }

  pickProfilePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    print(image!.path);

    profilePicture = File(image.path);

    update();
  }
}
