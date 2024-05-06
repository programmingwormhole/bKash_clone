import 'package:flutter/material.dart';

List<Widget> carouselItems = [
  Container(
    height: 200,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/sliderImage1.png',
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    height: 200,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/sliderImage2.png',
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    height: 200,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/sliderImage3.png',
        fit: BoxFit.cover,
      ),
    ),
  ),
];
