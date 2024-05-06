import 'package:flutter/material.dart';

Widget menuItem(String menuIcon, String name, onTapFun) {
  return InkWell(
    onTap: onTapFun,
    child: Column(
      children: [
        Image.asset(menuIcon,
          height: 50,
        ),
        Text(name),
        SizedBox(
          width: 20,
        )
      ],
    ),
  );
}
