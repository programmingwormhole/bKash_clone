import 'package:bKash_flutter/controllers/auth_controller.dart';
import 'package:bKash_flutter/global_widgets/custom_auth_app_bar.dart';
import 'package:bKash_flutter/global_widgets/custom_bottom_bar_button.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final controller = Get.put(AuthController());
  bool enable = false;

  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                'assets/images/bKash_logo.png',
                height: 45,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verify',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Your Mobile Number',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              OTPTextField(
                width: MediaQuery.of(context).size.width,
                length: 6,
                onChanged: (value) {
                  controller.otp.value = value;
                  if (value.length == 6) {
                    setState(() {
                      enable = true;
                    });
                  } else {
                    setState(() {
                      enable = false;
                    });
                  }
                },
                onCompleted: (otp) {
                  print('Your Enter : $otp');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Verification code has been sent to',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Text(
                    controller.number.value,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      '(Change)',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.pink,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/images/do_not_share.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBarButton(
        enable: enable,
        onTap: () => controller.verifyOtp(),
      ),
    );
  }
}
