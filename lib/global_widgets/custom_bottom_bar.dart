import 'package:bKash_flutter/views/history/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.pink,
      notchMargin: 6.0,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                // minWidth: 40,
                onPressed: () {},
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home_outlined, color: Colors.white, size: 30.0),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Scan QR',
                  style: TextStyle(color: Colors.white60),
                ),
              ),

              MaterialButton(
                // minWidth: 40,
                onPressed: () => Get.to(() => const HistoryScreen()),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.history,
                        color: Colors.white60, size: 30.0),
                    Text(
                      'History',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}