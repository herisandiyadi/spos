// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxLiteModelImpl _$$TaxLiteModelImplFromJson(Map<String, dynamic> json) =>
    _$TaxLiteModelImpl(
      taxID: (json['taxID'] as num).toInt(),
      taxName: json['taxName'] as String,
      taxPercent: (json['taxPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$TaxLiteModelImplToJson(_$TaxLiteModelImpl instance) =>
    <String, dynamic>{
      'taxID': instance.taxID,
      'taxName': instance.taxName,
      'taxPercent': instance.taxPercent,
    };
