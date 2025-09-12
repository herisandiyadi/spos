import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_transaction.freezed.dart';
part 'g_transaction.g.dart';

class ListMapConverter
    implements JsonConverter<List<Map<String, dynamic>>, dynamic> {
  const ListMapConverter();

  @override
  List<Map<String, dynamic>> fromJson(dynamic json) {
    try {
      if (json == null || (json is String && json.trim().isEmpty)) return [];
      if (json is String)
        return List<Map<String, dynamic>>.from(jsonDecode(json));
      if (json is List) return List<Map<String, dynamic>>.from(json);
    } catch (e) {
      throw Exception("Error list map converter: $e, raw: $json");
    }
    return [];
  }

  @override
  dynamic toJson(List<Map<String, dynamic>> object) => jsonEncode(object);
}

@freezed
class TransactionLiteModel with _$TransactionLiteModel {
  const factory TransactionLiteModel({
    @JsonKey(name: 'transactionID') required int transactionID,
    @JsonKey(name: 'transactionNumber') String? transactionNumber,
    @JsonKey(name: 'datetime') String? datetime,
    @JsonKey(name: 'outletName') String? outletName,
    @JsonKey(name: 'customerID') required int customerID,
    @JsonKey(name: 'customerCode') String? customerCode,
    @JsonKey(name: 'customerName') String? customerName,
    @JsonKey(name: 'tableID') required int tableID,
    @JsonKey(name: 'tableLabel') String? tableLabel,
    @JsonKey(name: 'guestNumber') required int guestNumber,
    @JsonKey(name: 'transactionType') String? transactionType,
    @JsonKey(name: 'subTotal') required int subTotal,
    @JsonKey(name: 'discountTotal') required int discountTotal,
    @ListMapConverter() required List<Map<String, dynamic>> discountOnDetail,
    @ListMapConverter() required List<Map<String, dynamic>> discountOnTrans,
    @JsonKey(name: 'grandTotalBeforeTax') required int grandTotalBeforeTax,
    @JsonKey(name: 'ppn') required int ppn,
    @JsonKey(name: 'ppnName') required String? ppnName,
    @JsonKey(name: 'serviceCharge') required int serviceCharge,
    @JsonKey(name: 'packageNService') required int packageNService,
    @JsonKey(name: 'grandTotalAfterTax') required int grandTotalAfterTax,
    @JsonKey(name: 'rounding') required int rounding,
    @JsonKey(name: 'grandTotalFinal') required int grandTotalFinal,
    @JsonKey(name: 'posLoginID') required int posLoginID,
    @JsonKey(name: 'closeBillStaffID') required int closeBillStaffID,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'statusTransaction') String? statusTransaction,
    @JsonKey(name: 'statusSync') required int statusSync,
    @JsonKey(name: 'statusReceipt') required int statusReceipt,
  }) = _TransactionLiteModel;

  factory TransactionLiteModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionLiteModelFromJson(json);
}
