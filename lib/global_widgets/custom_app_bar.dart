import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget customPageBar(String title) {
  return AppBar(
    backgroundColor: Colors.pink,
    leading: InkWell(
      onTap: () => Get.back(),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    elevation: 1,
    actions: [
      Image.asset(
        'assets/images/bKash_logo.png',
        color: Colors.white,
        height: 35,
        width: 35,
      ),
      const SizedBox(
        width: 15,
      )
    ],
  );
}
