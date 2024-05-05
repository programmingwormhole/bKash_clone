import 'package:bKash_flutter/routes/route_names.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> sliderImage = [
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds3.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: CarouselSlider(
                items: sliderImage,
                options: CarouselOptions(
                    autoPlay: true, height: 300, viewportFraction: 1)),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Create account with your NID',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Within a minutes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 7,
                  vertical: 12),
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () {
              Get.toNamed(RouteNames.auth);
            },
            child: const Text(
              "Login / Registration",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(RouteNames.auth);
            },
            child: const Text(
              'Visit the apps!',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
