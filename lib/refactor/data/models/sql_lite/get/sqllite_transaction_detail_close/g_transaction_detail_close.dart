import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_transaction_detail_close.freezed.dart';
part 'g_transaction_detail_close.g.dart';

class ListMapConverter implements JsonConverter<List<Map<String, dynamic>>, dynamic> {
  const ListMapConverter();

  @override
  List<Map<String, dynamic>> fromJson(dynamic json) {
    if (json is String) {
      return List<Map<String, dynamic>>.from(jsonDecode(json));
    }
    if (json is List) {
      return List<Map<String, dynamic>>.from(json);
    }
    return [];
  }

  @override
  dynamic toJson(List<Map<String, dynamic>> object) => object;
}

@freezed
class TransactionDetailCloseLiteModel with _$TransactionDetailCloseLiteModel {
  const factory TransactionDetailCloseLiteModel({
    @JsonKey(name: 'transactionDetailID') required int transactionDetailID,
    @JsonKey(name: 'datetime') required String datetime,
    @JsonKey(name: 'transactionNumber') required String transactionNumber,
    @JsonKey(name: 'menuID') required int menuID,
    @JsonKey(name: 'menuName') required String menuName,
    @JsonKey(name: 'totalQty') required int totalQty,
    @JsonKey(name: 'totalPrice') required int totalPrice,
    @JsonKey(name: 'discountDetail') @ListMapConverter() required List<Map<String, dynamic>> discountDetail,
    @JsonKey(name: 'menuPriceAfterDiscount') required int menuPriceAfterDiscount,
    @JsonKey(name: 'noteOption') required String noteOption,
    @JsonKey(name: 'parentID') int? parentID,
    @JsonKey(name: 'menuImage') required String menuImage,
    @JsonKey(name: 'statusSend') int? statusSend,
    @JsonKey(name: 'stationID') int? stationID,
    @JsonKey(name: 'addOn') @ListMapConverter() required List<Map<String, dynamic>> addOn,
  }) = _TransactionDetailCloseLiteModel;

  factory TransactionDetailCloseLiteModel.fromJson(Map<String, dynamic> json) => _$TransactionDetailCloseLiteModelFromJson(json);
}
