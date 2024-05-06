
import 'package:flutter/material.dart';
Widget mybKashItem(iconData, name) {
  return Column(
    children: [
      Image.asset(iconData, height: 50),
      const SizedBox(
        height: 5,
      ),
      Text(name),
    ],
  );
}