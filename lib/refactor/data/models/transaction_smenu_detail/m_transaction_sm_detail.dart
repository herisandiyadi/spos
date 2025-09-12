import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_transaction_sm_detail.freezed.dart';
part 'm_transaction_sm_detail.g.dart';

// Decoder utama
TransactionSMDetailModel transactionSMDetailFromJson(String str) =>
    TransactionSMDetailModel.fromJson(json.decode(str));
// Encoder (kalau dibutuhkan)
String transactionSMDetailToJson(TransactionSMDetailModel data) =>
    json.encode(data.toJson());

@freezed
class TransactionSMDetailModel with _$TransactionSMDetailModel {
  const factory TransactionSMDetailModel({
    String? status,
    @JsonKey(name: 'data') TransactionSMHeaderData? data,
  }) = _TransactionSMDetailModel;

  factory TransactionSMDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionSMDetailModelFromJson(json);
}

@freezed
class TransactionSMHeaderData with _$TransactionSMHeaderData {
  const factory TransactionSMHeaderData({
    @JsonKey(name: 'TransactionID') int? transactionID,
    @JsonKey(name: 'TransactionNumber') String? transactionNumber,
    @JsonKey(name: 'Datetime') String? datetime,
    @JsonKey(name: 'TableID') String? tableID,
    @JsonKey(name: 'TableNumber') String? tableNumber,
    @JsonKey(name: 'TableLabel') String? tableLabel,
    @JsonKey(name: 'TransactionType') String? transactionType,
    @JsonKey(name: 'CustomerID') String? customerID,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'PPN') int? ppn,
    @JsonKey(name: 'Rounding') int? rounding,
    @JsonKey(name: 'SubTotal') int? subTotal,
    @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
    @JsonKey(name: 'UniqeNumber') int? uniqueNumber,
    @JsonKey(name: 'StatusTransaction') String? statusTransaction,
    @JsonKey(name: 'UrlQrCode') String? urlQRCode,
    @JsonKey(name: 'Details')
    @Default([])
    List<TransactionSMDetailData> details,
  }) = _TransactionSMHeaderData;

  factory TransactionSMHeaderData.fromJson(Map<String, dynamic> json) =>
      _$TransactionSMHeaderDataFromJson(json);
}

@freezed
class TransactionSMDetailData with _$TransactionSMDetailData {
  const factory TransactionSMDetailData({
    @JsonKey(name: 'CartID') int? cartID,
    @JsonKey(name: 'CartDetailID') int? cartDetailID,
    @JsonKey(name: 'MenuID') int? menuID,
    @JsonKey(name: 'MenuName') String? menuName,
    @JsonKey(name: 'ParentID') int? parentID,
    @JsonKey(name: 'SendOrder') int? sendOrder,
    @JsonKey(name: 'Notes') String? notes,
    @JsonKey(name: 'MenuImage') String? menuImage,
    @JsonKey(name: 'Qty') int? qty,
    @JsonKey(name: 'MenuPrice') int? menuPrice,
    @JsonKey(name: 'DiscountDetail') @Default([]) List<dynamic> discountDetail,
    @JsonKey(name: 'TotalPriceItem') int? totalPriceItem,
    @JsonKey(name: 'PrintKitchen') int? printKitchen,
    @JsonKey(name: 'StationID') int? stationID,
    @JsonKey(name: 'addOn') @Default([]) List<AddOn> addOn,
  }) = _TransactionSMDetailData;

  factory TransactionSMDetailData.fromJson(Map<String, dynamic> json) =>
      _$TransactionSMDetailDataFromJson(json);
}

@freezed
class AddOn with _$AddOn {
  const factory AddOn({
    @JsonKey(name: 'MenuID') int? menuId,
    @JsonKey(name: 'MenuName') String? menuName,
    @JsonKey(name: 'SendOrder') int? sendOrder,
    @JsonKey(name: 'Notes') String? notes,
    @JsonKey(name: 'MenuImage') String? menuImage,
    @JsonKey(name: 'Qty') int? qty,
    @JsonKey(name: 'MenuPrice') int? menuPrice,
    @JsonKey(name: 'PrintKitchen') int? printKitchen,
    @JsonKey(name: 'StationID') int? stationID,
    @JsonKey(name: 'DiscountDetail') @Default([]) List<dynamic> discountDetail,
    @JsonKey(name: 'TotalPriceItem') int? totalPriceItem,
  }) = _AddOn;

  factory AddOn.fromJson(Map<String, dynamic> json) => _$AddOnFromJson(json);
}
