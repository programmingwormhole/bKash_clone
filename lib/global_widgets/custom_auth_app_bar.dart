import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white24,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.pink,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 5, bottom: 5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              side: const BorderSide(color: Colors.pink, width: 1.5),
            ),
            onPressed: () {},
            child: const Text(
              'বাংলা',
              style: TextStyle(
                fontSize: 16,
                color: Colors.pink,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
