import 'package:bKash_flutter/controllers/wallet_controller.dart';
import 'package:bKash_flutter/utils/config.dart';
import 'package:bKash_flutter/views/sendMoney/sendMoneyDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_app_bar.dart';

class AmountScreen extends StatelessWidget {
  AmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());

    final mediaSize = MediaQuery.of(context).size;
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
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Receiver'),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(controller.receiverData.value.profilePicture!,
                            ),
                          ),
                          title: Text(
                              '${controller.receiverData.value.firstName} ${controller.receiverData.value.lastName}'),
                          subtitle: Text(controller.receiverData.value.phoneNumber!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                width: mediaSize.width - 30,
                height: 170,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Amount'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: Colors.pink,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => controller.amount.value = value,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (controller.amount.value.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SendMoneyDetails(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: Colors.pink,
                              )),
                          hintText: '\$0',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 40,
                          ),
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
