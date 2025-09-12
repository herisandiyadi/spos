// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxModelImpl _$$TaxModelImplFromJson(Map<String, dynamic> json) =>
    _$TaxModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TaxData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TaxModelImplToJson(_$TaxModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TaxDataImpl _$$TaxDataImplFromJson(Map<String, dynamic> json) =>
    _$TaxDataImpl(
      taxID: json['TaxID'] as String?,
      taxName: json['TaxName'] as String?,
      taxPercent: json['TaxPercent'] as String?,
      companyCode: json['CompanyCode'] as String?,
    );

Map<String, dynamic> _$$TaxDataImplToJson(_$TaxDataImpl instance) =>
    <String, dynamic>{
      'TaxID': instance.taxID,
      'TaxName': instance.taxName,
      'TaxPercent': instance.taxPercent,
      'CompanyCode': instance.companyCode,
    };
