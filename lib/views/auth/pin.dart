import 'package:bKash_flutter/controllers/auth_controller.dart';
import 'package:bKash_flutter/controllers/home_controller.dart';
import 'package:bKash_flutter/core/services/shared_services.dart';
import 'package:bKash_flutter/global_widgets/custom_auth_app_bar.dart';
import 'package:bKash_flutter/global_widgets/custom_bottom_bar_button.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:bKash_flutter/views/auth/name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  bool buttonActive = false;
  final _formKey = GlobalKey<FormState>();

  static Map arguments = Get.arguments;

  final String state = arguments['state'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final homeController = Get.put(HomeController());

    return Scaffold(
      appBar: const CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/bKash_logo.png',
                    height: 45,
                  ),
                  Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_hrczfk4y.json',
                    height: 60,
                    width: 60,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                state == 'register' ? 'Set PIN Number' : 'Log In',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'to your bKash account',
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Mobile Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: homeController.userData.value.phoneNumber ??
                      controller.number.value,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'bKash PIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Forgot PIN?',
                    style: const TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    controller.pin.value = value;
                    if (value.length == 6) {
                      setState(() {
                        buttonActive = true;
                      });
                    } else {
                      setState(() {
                        buttonActive = false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your PIN';
                    } else if (value.length < 6) {
                      return 'PIN must be in 6 digits';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  obscureText: true,
                  obscuringCharacter: '•',
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter bkash PIN',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBarButton(
        enable: buttonActive,
        onTap: () {
          if (state == 'register') {
            Get.toNamed(RouteNames.name);
          } else {
            if (homeController.userData.value.pin != controller.pin.value) {
              Get.snackbar('Error', 'Invalid PIN Number');
              return;
            }

            SharedServices.setData(
              SetType.string,
              'phone',
              homeController.userData.value.phoneNumber,
            );

            Get.offAllNamed(RouteNames.home);
          }
        },
      ),
    );
  }
}
