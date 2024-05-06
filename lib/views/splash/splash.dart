import 'package:bKash_flutter/core/services/shared_services.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/services/api_services.dart';
import '../../models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    checkUserState();
  }

  checkUserState() async {
    final token = await SharedServices.getData(SetType.string, 'token');
    final number = await SharedServices.getData(SetType.string, 'phone');

    if (token != null && number != null) {
      final response = await ApiServices.userData();

      homeController.userData.value = userModelFromJson(response.body);

      Get.toNamed(
        RouteNames.pin,
        arguments: {
          'state': 'login',
        },
      );
    } else {
      Get.toNamed(RouteNames.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/bKash_logo.png',
          width: 200,
        ),
      ),
    );
  }
}
