import 'package:bKash_flutter/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isBalanceShown = false;
  bool _isBalance = true;
  bool _isAnimation = false;

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: controller.userData.value.profilePicture ==
                          null
                      ? null
                      : NetworkImage(
                          '${AppConfig.baseUrl}${controller.userData.value.profilePicture!}'),
                  radius: 30,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      controller.userData.value.firstName == null
                          ? ''
                          : '${controller.userData.value.firstName} ${controller.userData.value.lastName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: changeState,
                    child: Container(
                      width: 150,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: _isBalanceShown ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(controller.userData.value.balance ?? '00',
                              style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _isBalance ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: const Text(
                              'See Balance',
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 1100),
                            left: _isAnimation == false ? 5 : 125,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              height: 20,
                              width: 20,
                              // padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const FittedBox(
                                child: Text(
                                  '৳',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeState() async {
    _isAnimation = true;
    _isBalance = false;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBalanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
        () => setState(() => _isBalanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
        () => setState(() => _isAnimation = false));
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBalance = true));
  }
}
