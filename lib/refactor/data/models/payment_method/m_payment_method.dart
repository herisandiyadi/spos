import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_payment_method.freezed.dart';
part 'm_payment_method.g.dart';

PaymentMethodModel paymentMethodFromJson(String str) => PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodToJson(PaymentMethodModel data) => json.encode(data.toJson());

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    required String status,
    String? message,
    @Default([]) List<PaymentMethodData> data,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodModelFromJson(json);
}

@freezed
class PaymentMethodData with _$PaymentMethodData {
  const factory PaymentMethodData({
    @JsonKey(name: 'PaymentMethodID') String? paymentMethodID,
    @JsonKey(name: 'PaymentMethodName') String? paymentMethodName,
    @JsonKey(name: 'PaymentFee') String? paymentFee,
    @JsonKey(name: 'CompanyCode') String? companyCode,
  }) = _PaymentMethodData;

  factory PaymentMethodData.fromJson(Map<String, dynamic> json) => _$PaymentMethodDataFromJson(json);
}
