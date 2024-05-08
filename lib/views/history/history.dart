import 'package:bKash_flutter/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final controller = Get.put(WalletController());

  @override
  void initState() {
    super.initState();
    controller.getTransactionHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final data = controller.transactionHistory[index];
                  return Card(
                    child: ListTile(
                      title: Text(data.type! == 'send_money' ? 'Send Money' : data.type!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.createdAt!.toIso8601String()),
                          Text(data.trxId!),
                          Text('${data.receiver!.firstName ?? 'NULL'} ${data.receiver!.lastName ?? 'NULL'}'),
                        ],
                      ),
                      trailing: Text('৳${data.amount}'),
                    ),
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: controller.transactionHistory.length,
              ),
            );
          }
        },
      ),
    );
  }
}
