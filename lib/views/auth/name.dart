import 'package:bKash_flutter/controllers/auth_controller.dart';
import 'package:bKash_flutter/global_widgets/custom_auth_app_bar.dart';
import 'package:bKash_flutter/global_widgets/custom_bottom_bar_button.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool buttonActive = false;
  final _formKey = GlobalKey<FormState>();
  final _globalNew = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppBar(),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Set Your Name',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Your name will appear on your bKash App home screen.',
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 12),
              ),
              Text(
                'Only you can see this.',
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'First Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Form(
                key: _globalNew,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      readOnly: false,
                      decoration: InputDecoration(
                        hintText: 'Enter your first name',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                      onChanged: (value) {
                        controller.fName.value = value;
                        if (value.isEmpty) {
                          setState(() {
                            buttonActive = false;
                          });
                        } else {
                          setState(() {
                            buttonActive = true;
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Last Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controller.lName.value = value;
                        if (value.isEmpty) {
                          setState(() {
                            buttonActive = false;
                          });
                        } else {
                          setState(
                            () {
                              buttonActive = true;
                            },
                          );
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Enter your last name',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBarButton(
        enable: buttonActive,
        onTap: () => Get.toNamed(RouteNames.profilePicture),
      ),
    );
  }
}
