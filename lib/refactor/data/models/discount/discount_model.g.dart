// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountModelImpl _$$DiscountModelImplFromJson(Map<String, dynamic> json) =>
    _$DiscountModelImpl(
      masterDiscountID: (json['masterDiscountID'] as num).toInt(),
      masterDiscountName: json['masterDiscountName'] as String,
      discountType: (json['discountType'] as num).toInt(),
      valueType: json['valueType'] as String,
      discountValue: (json['discountValue'] as num).toInt(),
      spesificMenuID: json['spesificMenuID'] as String?,
      discountValidFrom: json['discountValidFrom'] as String?,
      discountValidUntil: json['discountValidUntil'] as String?,
      minTransDiscount: (json['minTransDiscount'] as num?)?.toInt(),
      outletID: (json['outletID'] as num?)?.toInt(),
      maxDiscount: (json['maxDiscount'] as num?)?.toInt(),
      qtyDiscount: (json['qtyDiscount'] as num?)?.toInt(),
      availableDay: json['availableDay'] as String?,
    );

Map<String, dynamic> _$$DiscountModelImplToJson(_$DiscountModelImpl instance) =>
    <String, dynamic>{
      'masterDiscountID': instance.masterDiscountID,
      'masterDiscountName': instance.masterDiscountName,
      'discountType': instance.discountType,
      'valueType': instance.valueType,
      'discountValue': instance.discountValue,
      'spesificMenuID': instance.spesificMenuID,
      'discountValidFrom': instance.discountValidFrom,
      'discountValidUntil': instance.discountValidUntil,
      'minTransDiscount': instance.minTransDiscount,
      'outletID': instance.outletID,
      'maxDiscount': instance.maxDiscount,
      'qtyDiscount': instance.qtyDiscount,
      'availableDay': instance.availableDay,
    };
