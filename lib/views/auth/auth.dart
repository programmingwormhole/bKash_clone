import 'package:bKash_flutter/controllers/auth_controller.dart';
import 'package:bKash_flutter/global_widgets/custom_auth_app_bar.dart';
import 'package:bKash_flutter/global_widgets/custom_bottom_bar_button.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final controller = Get.put(AuthController());

  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAuthAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Image.asset(
              'assets/images/bKash_logo.png',
              height: 45,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Enter mobile number',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            RichText(
              text: const TextSpan(
                text: 'for ',
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    fontSize: 20),
                children: [
                  TextSpan(
                    text: 'Login / Registration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Mobile Number'),
            IntlPhoneField(
              showCountryFlag: false,
              onChanged: (value) {
                controller.number.value = value.completeNumber;

                if (controller.number.value.length == 14) {
                  setState(() {
                    enable = true;
                  });
                } else {
                  setState(() {
                    enable = false;
                  });
                }
              },
              initialCountryCode: 'BD',
              decoration: InputDecoration(
                hintText: '01xxxxxxxxx',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Proceeding you agree to our ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                ),
                children: const [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: Colors.pink,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBarButton(
        enable: enable,
        onTap: () {
          controller.auth();
        },
      ),
    );
  }
}
