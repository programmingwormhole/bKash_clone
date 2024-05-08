import 'package:bKash_flutter/controllers/wallet_controller.dart';
import 'package:bKash_flutter/views/sendMoney/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_animated_button.dart';

class confirmPayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
                size: 30,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            //DO your ui design
            // I am keeping it blank for the demo
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: 'Confirm ',
                          style: TextStyle(color: Colors.pink, fontSize: 18),
                          children: [
                        TextSpan(
                            text: 'Send Money',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(controller.receiverData.value.profilePicture!,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${controller.receiverData.value.firstName} ${controller.receiverData.value.lastName}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(controller.receiverData.value.phoneNumber!,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('\$${controller.amount.value}.00'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${controller.amount.value}.00 + \$00.00',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            VerticalDivider(
                              color: Colors.black.withOpacity(1),
                              width: 15,
                            ),
                            Text(''),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Balance',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('\$${controller.amount.value}.00'),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Text(
                    'Reference',
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('ref'),
                ],
              ),
            ),
          ),
          //Animated button
          AnimatedButton(
            onComplete: () {
              controller.sendMoney();
              // Get.offAll(() => const SuccessScreen());
            },
          )
        ],
      ),
    );
  }
}
