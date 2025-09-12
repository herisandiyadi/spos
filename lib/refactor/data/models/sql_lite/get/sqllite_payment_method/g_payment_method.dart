import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_payment_method.freezed.dart';
part 'g_payment_method.g.dart';

@freezed
class PaymentMethodLiteModel with _$PaymentMethodLiteModel {
  const factory PaymentMethodLiteModel({
    @JsonKey(name: 'paymentMethodID') required int paymentMethodID,
    @JsonKey(name: 'paymentMethodName') required String paymentMethodName,
    @JsonKey(name: 'paymentFee') required double paymentFee,
  }) = _PaymentMethodLiteModel;

  factory PaymentMethodLiteModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodLiteModelFromJson(json);
}
