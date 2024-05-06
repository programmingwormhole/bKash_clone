import 'package:flutter/material.dart';
Widget offerItems(Size mediaSize) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 0.4)
        ],
        borderRadius: BorderRadius.circular(5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          child: Image.asset(
            'assets/images/cashBack.jpg',
            fit: BoxFit.cover,
            height: 85,
            width: mediaSize.width,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(' Robi'),
        Text(
          ' Non-Stop Cashback',
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    ),
  );
}