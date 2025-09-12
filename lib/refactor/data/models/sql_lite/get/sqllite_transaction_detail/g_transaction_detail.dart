import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_transaction_detail.freezed.dart';
part 'g_transaction_detail.g.dart';

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
class TransactionDetailLiteModel with _$TransactionDetailLiteModel {
  const factory TransactionDetailLiteModel({
    @JsonKey(name: 'transactionDetailID') required int transactionDetailID,
    @JsonKey(name: 'transactionNumber') required String transactionNumber,
    @JsonKey(name: 'menuID') required int menuID,
    @JsonKey(name: 'menuName') required String menuName,
    @JsonKey(name: 'qty') required int qty,
    @JsonKey(name: 'menuPrice') required int menuPrice,
    @ListMapConverter() required List<Map<String, dynamic>> discountDetail,
    @JsonKey(name: 'menuPriceAfterDiscount')
    required int menuPriceAfterDiscount,
    @JsonKey(name: 'noteOption') required String noteOption,
    @JsonKey(name: 'notes') required String notes,
    @JsonKey(name: 'parentID') int? parentID,
    @JsonKey(name: 'menuImage') required String menuImage,
    @JsonKey(name: 'statusSend') int? statusSend,
    @JsonKey(name: 'stationID') int? stationID,
    @JsonKey(name: 'statusItem') required String statusItem,
    @ListMapConverter() required List<Map<String, dynamic>> addOn,
  }) = _TransactionDetailLiteModel;

  factory TransactionDetailLiteModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailLiteModelFromJson(json);
}
