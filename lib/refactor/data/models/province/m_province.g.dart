// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceModelImpl _$$ProvinceModelImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProvinceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProvinceModelImplToJson(_$ProvinceModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$ProvinceDataImpl _$$ProvinceDataImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceDataImpl(
      provinceId: json['ProvinceID'] as String?,
      provinceName: json['ProvinceName'] as String?,
      timezone: json['Timezone'] as String?,
      value: json['Value'] as String?,
    );

Map<String, dynamic> _$$ProvinceDataImplToJson(_$ProvinceDataImpl instance) =>
    <String, dynamic>{
      'ProvinceID': instance.provinceId,
      'ProvinceName': instance.provinceName,
      'Timezone': instance.timezone,
      'Value': instance.value,
    };
