import 'dart:developer';

import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/services/discount/discount_service.dart';
import 'package:squadra_pos/refactor/data/models/discount/discount_model.dart';
import 'package:intl/intl.dart';

class DiscountController extends GetxController {
  final DiscountService _discountService = DiscountService();

  var discountList = <DiscountModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // State global untuk selected discount
  final RxInt selectedDiscountId = 0.obs;
  final Rx<double> discountValue = 0.0.obs;

  Future<void> getDiscountToday(String today) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await _discountService.getDiscountToday(today);
      discountList.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
      discountList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDiscountByTypeAndDay(int discountType) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final today = DateFormat('EEEE').format(DateTime.now());
      final result =
          await _discountService.getDiscountByTypeAndDay(today, discountType);
      discountList.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
      discountList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void selectDiscount(dynamic id, {double? subtotal}) {
    try {
      // Extra logging and type safety
      log("selectDiscount called with id: $id (type: ${id.runtimeType})");
      int? intId;
      if (id == null) {
        log("selectDiscount: id is null");
        return;
      } else if (id is int) {
        intId = id;
      } else if (id is double) {
        intId = id.toInt();
      } else if (id is String) {
        intId = int.tryParse(id);
      } else {
        log("selectDiscount: Unexpected id type: ${id.runtimeType}");
        return;
      }
      if (intId == null) {
        log("selectDiscount: intId is null after conversion, aborting.");
        return;
      }
      selectedDiscountId.value = intId;
      // Hitung nilai diskon jika subtotal diberikan
      if (subtotal != null) {
        final selected =
            discountList.firstWhereOrNull((e) => e.masterDiscountID == intId);
        if (selected != null) {
          if (selected.valueType == 'Nominal') {
            discountValue.value = selected.discountValue.toDouble();
          } else if (selected.valueType == 'Percent' ||
              selected.valueType == 'Persen') {
            discountValue.value = subtotal * selected.discountValue / 100;
            log("DATA DISKON ${discountValue.value} -- ${selected.discountValue}");
          } else {
            discountValue.value = 0;
          }
        }
      }
    } catch (e, stack) {
      log("selectDiscount ERROR: $e\n$stack");
      rethrow;
    }
  }

  void removeSelectedDiscount() {
    selectedDiscountId.value = 0;
    discountValue.value = 0;
  }

  void resetSelectedDiscountOnDelete() {
    if (discountList.isEmpty) {
      selectedDiscountId.value = 0;
    }
  }
}
