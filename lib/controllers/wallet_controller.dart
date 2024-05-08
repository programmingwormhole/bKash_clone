import 'dart:convert';

import 'package:bKash_flutter/core/services/api_services.dart';
import 'package:bKash_flutter/models/transaction_history_model.dart';
import 'package:bKash_flutter/models/transaction_success_model.dart';
import 'package:bKash_flutter/views/sendMoney/amountScreen.dart';
import 'package:bKash_flutter/views/sendMoney/successScreen.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class WalletController extends GetxController {
  RxString receiverNumber = RxString('');
  RxString name = RxString('');
  RxString amount = RxString('');

  var transactionHistory = <TransactionHistoryModel>[].obs;

  RxBool isLoading = RxBool(false);

  var receiverData = UserModel().obs;

  checkNumber() async {
    final response = await ApiServices.checkNumber(
      receiverNumber.value,
    );

    print(response.body);

    if (response.statusCode != 200) {
      Get.snackbar(
        'Error',
        'User not exists in our DB',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final decoded = jsonDecode(response.body);

    receiverData.value = userModelFromJson(jsonEncode(decoded['user']));

    update();

    Get.to(() => AmountScreen());
  }

  sendMoney() async {
    final response = await ApiServices.sendMoney(
      amount: amount.value,
      receiverNumber: receiverNumber.value,
    );

    print(response.body);

    final decode = jsonDecode(response.body);

    if (response.statusCode != 200) {
      Get.snackbar('Error', decode['message']);
      return;
    }

    final model = transactionSuccessModelFromJson(response.body);

    Get.to(
      () => SuccessScreen(
        response: model,
      ),
    );
  }

  getTransactionHistory () async {
    isLoading.value = true;

    final response = await ApiServices.transactionHistory();
    isLoading.value = false;

    if (response.statusCode != 200) {
      Get.snackbar('Error', 'Something is wrong');
      return;
    }

    transactionHistory.value = transactionHistoryModelFromJson(response.body);

    update();

  }
}
