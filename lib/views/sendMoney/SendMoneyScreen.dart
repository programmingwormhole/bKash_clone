import 'package:bKash_flutter/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_app_bar.dart';
import 'amountScreen.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: customPageBar('Send Money'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: mediaSize.width - 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Receiver'),
                        Divider(
                          color: Colors.black.withOpacity(0.1),
                          thickness: 1,
                        ),
                        Obx(
                          () => TextFormField(
                            onChanged: (value) =>
                                controller.receiverNumber.value = value,
                            cursorColor: Colors.pink,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter phone number',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              suffixIcon: IconButton(
                                onPressed:
                                    controller.receiverNumber.value.length > 10
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => AmountScreen(),
                                              ),
                                            );
                                          }
                                        : null,
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color:
                                      controller.receiverNumber.value.length >
                                              10
                                          ? Colors.pink
                                          : Colors.black.withOpacity(.3),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
