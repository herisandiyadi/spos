import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_check_out.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/component_smenu_checkout/payment_method_button.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_other_payment_method.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class PaymentMethodGrid extends StatelessWidget {
  PaymentMethodGrid({super.key, this.header});

  final transactionCheckOutSMController = Get.find<TransactionCheckOutSMController>();
  final TransactionSMHeaderData? header;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120.h,
      child: Obx(() {
        final data = transactionCheckOutSMController.paymentMethod.toList();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 4.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            if (index >= data.length) return const SizedBox();

            return Obx(() {
              final selectedId = transactionCheckOutSMController.isPaymentMethodId.value;
              final method = data[index];

              return PaymentMethodButton(
                isOther: index == 3,
                method: method,
                isSelected: method.paymentMethodID == selectedId,
                onTap: () {
                  final controller = transactionCheckOutSMController;

                  controller.nominalController.clear();

                  if (index == 3) {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => SMOtherPaymentMethod(),
                    );
                  } else {
                    controller.nominalController.text = numberFormatNoIDR(header?.grandTotalFinal ?? 0);
                    controller.isPaymentMethodId.value = method.paymentMethodID;
                    controller.isPaymentMethodName.value = method.paymentMethodName;
                  }
                },
              );
            });
          },
        );
      }),
    );
  }
}
