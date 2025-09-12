import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';

class CheckOutOfflineController extends GetxController {
  CheckOutOfflineController(this.localStorage);

  final LocalStorage localStorage;
  
  RxInt grandTotal = 0.obs;
}