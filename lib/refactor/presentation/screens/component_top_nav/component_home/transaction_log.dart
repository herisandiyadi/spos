import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_offline.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/transaction_all.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/transaction_close.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/transaction_open.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/transaction_smenu.dart';

class TransactionLog extends StatelessWidget {
  TransactionLog({super.key});

  final _transactionOfflineController =
      Get.find<TransactionOfflineController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: TabBarView(
        controller: _transactionOfflineController.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          TransactionAll(),
          TransactionOpen(),
          TransactionClose(),
          TransactionSMenu(),
        ],
      ),
    );
  }
}
