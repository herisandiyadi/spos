// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodLiteModelImpl _$$PaymentMethodLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodLiteModelImpl(
      paymentMethodID: (json['paymentMethodID'] as num).toInt(),
      paymentMethodName: json['paymentMethodName'] as String,
      paymentFee: (json['paymentFee'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentMethodLiteModelImplToJson(
        _$PaymentMethodLiteModelImpl instance) =>
    <String, dynamic>{
      'paymentMethodID': instance.paymentMethodID,
      'paymentMethodName': instance.paymentMethodName,
      'paymentFee': instance.paymentFee,
    };
