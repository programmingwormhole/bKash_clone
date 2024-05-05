import 'package:bKash_flutter/controllers/auth_controller.dart';
import 'package:bKash_flutter/global_widgets/custom_auth_app_bar.dart';
import 'package:bKash_flutter/global_widgets/custom_bottom_bar_button.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({super.key});

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  bool isChecked = false;

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(children: [
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
            const Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add your profile picture',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Text(
                    'Tap below add icon (+) to take a photo or upload your picture.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<AuthController>(
                  builder: (controller) => InkWell(
                    onTap: () {
                      controller.pickProfilePicture();
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          height: 180,
                          width: 180,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          height: 130,
                          width: 130,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: controller.profilePicture == null
                                ? Image.network(
                                    'https://med.gov.bz/wp-content/uploads/2020/08/dummy-profile-pic.jpg',
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    controller.profilePicture!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 45,
                          right: 45,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              color: Colors.pink,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: isChecked
                          ? MaterialStateProperty.all(Colors.pink)
                          : MaterialStateProperty.all(Colors.grey),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree with your Terms & Conditions.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
      bottomNavigationBar: CustomBottomBarButton(
        enable: isChecked,
        onTap: () => controller.setupProfile(),
      ),
    );
  }
}
