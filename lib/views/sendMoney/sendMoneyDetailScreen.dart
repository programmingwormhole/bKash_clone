import 'package:bKash_flutter/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_app_bar.dart';
import 'confirmPaymentScreen.dart';

class SendMoneyDetails extends StatelessWidget {
  SendMoneyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    TextEditingController _button = TextEditingController();
    TextEditingController _reff = TextEditingController();

    final controller = Get.put(WalletController());

    return Scaffold(
      appBar: customPageBar('Send Money'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: mediaSize.width - 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Receiver'),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/147/147144.png',
                            ),
                          ),
                          title: Text('Md Shirajul Islam'),
                          subtitle: Text('01758195324'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                width: mediaSize.width - 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Amount, Charge, Total Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Amount'),
                              Text('\$${controller.amount.value}'),
                            ],
                          ),
                          const Column(
                            children: [
                              Text('Charge'),
                              Text('\$0.00'),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Total'),
                              Text('\$${controller.amount.value}')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.2),
                      ),

                      TextFormField(
                        controller: _button,
                        cursorColor: Colors.pink,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                        obscureText: true,
                        obscuringCharacter: '•',
                        // keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.pink,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (_button.text.length > 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => confirmPayPage(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.pink,
                              )),
                          border: InputBorder.none,
                          hintText: 'Enter your PIN',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
