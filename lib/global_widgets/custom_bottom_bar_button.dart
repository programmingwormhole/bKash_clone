import 'package:flutter/material.dart';

class CustomBottomBarButton extends StatelessWidget {
  final bool enable;
  final void Function()? onTap;

  const CustomBottomBarButton({
    super.key,
    required this.enable, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: const RoundedRectangleBorder(),
        backgroundColor: enable ? Colors.pink : Colors.grey.withOpacity(0.5),
      ),
      onPressed: enable ? onTap : null,
      child: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
