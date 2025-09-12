import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_transaction_all.freezed.dart';
part 'g_transaction_all.g.dart';

class ListMapConverter
    implements JsonConverter<List<Map<String, dynamic>>, dynamic> {
  const ListMapConverter();

  @override
  List<Map<String, dynamic>> fromJson(dynamic json) {
    try {
      if (json == null || (json is String && json.trim().isEmpty)) return [];

      if (json is String) {
        final decoded = jsonDecode(json);
        if (decoded is List) {
          return List<Map<String, dynamic>>.from(decoded);
        }
      }

      if (json is List) {
        return List<Map<String, dynamic>>.from(json);
      }
    } catch (e) {
      throw Exception("Error list map converter: $e, raw: $json");
    }

    return [];
  }

  @override
  dynamic toJson(List<Map<String, dynamic>> object) => object;
}

@freezed
class TransactionLiteAllModel with _$TransactionLiteAllModel {
  const factory TransactionLiteAllModel({
    @JsonKey(name: 'transactionID') required int transactionID,
    @JsonKey(name: 'transactionNumber') required String transactionNumber,
    @JsonKey(name: 'datetime') required String datetime,
    @JsonKey(name: 'outletName') required String outletName,
    @JsonKey(name: 'customerID') required int customerID,
    @JsonKey(name: 'customerCode') String? customerCode,
    @JsonKey(name: 'customerName') required String customerName,
    @JsonKey(name: 'tableID') required int tableID,
    @JsonKey(name: 'guestNumber') required int guestNumber,
    @JsonKey(name: 'transactionType') required String transactionType,
    @JsonKey(name: 'transactionTypeJuncID') required int transactionTypeJuncID,
    @JsonKey(name: 'subTotal') required int subTotal,
    @JsonKey(name: 'discountTotal') required int discountTotal,
    @JsonKey(name: 'discountOnTrans')
    @ListMapConverter()
    required List<Map<String, dynamic>> discountOnTrans,
    @JsonKey(name: 'discountOnDetail')
    @ListMapConverter()
    required List<Map<String, dynamic>> discountOnDetail,
    @JsonKey(name: 'grandTotalBeforeTax') required int grandTotalBeforeTax,
    @JsonKey(name: 'ppn') required int ppn,
    @JsonKey(name: 'serviceCharge') required int serviceCharge,
    @JsonKey(name: 'packageNService') required int packageNService,
    @JsonKey(name: 'grandTotalAfterTax') required int grandTotalAfterTax,
    @JsonKey(name: 'rounding') required int rounding,
    @JsonKey(name: 'grandTotalFinal') required int grandTotalFinal,
    @JsonKey(name: 'posLoginID') required int posLoginID,
    @JsonKey(name: 'closeBillStaffID') required int closeBillStaffID,
    @JsonKey(name: 'paymentMethod')
    @ListMapConverter()
    required List<Map<String, dynamic>> paymentMethod,
    @JsonKey(name: 'statusTransaction') required String statusTransaction,
    @JsonKey(name: 'statusSync') required int statusSync,
    @JsonKey(name: 'appVersion') String? appVersion,
    @JsonKey(name: 'closeDate') required String closeDate,
    @JsonKey(name: 'details') @Default([]) List<Detail> details,
  }) = _TransactionLiteAllModel;

  factory TransactionLiteAllModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionLiteAllModelFromJson(json);
}

@freezed
class Detail with _$Detail {
  const factory Detail({
    @JsonKey(name: 'transactionDetailID') int? transactionDetailID,
    @JsonKey(name: 'transactionNumber') String? transactionNumber,
    @JsonKey(name: 'menuID') int? menuID,
    @JsonKey(name: 'menuName') String? menuName,
    @JsonKey(name: 'qty') int? qty,
    @JsonKey(name: 'menuPrice') int? menuPrice,
    @JsonKey(name: 'discountDetail')
    @ListMapConverter()
    required List<Map<String, dynamic>> discountDetail,
    @JsonKey(name: 'addOn')
    @ListMapConverter()
    required List<Map<String, dynamic>> addOn,
    @JsonKey(name: 'menuPriceAfterDiscount') int? menuPriceAfterDiscount,
    @JsonKey(name: 'noteOption') String? noteOption,
    @JsonKey(name: 'parentID') int? parentID,
    @JsonKey(name: 'menuImage') String? menuImage,
    @JsonKey(name: 'statusSend') int? statusSend,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'stationID') int? stationID,
    @JsonKey(name: 'statusItem') String? statusItem,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
