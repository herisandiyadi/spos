// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceLiteModelImpl _$$ProvinceLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProvinceLiteModelImpl(
      provinceID: (json['provinceID'] as num).toInt(),
      provinceName: json['provinceName'] as String,
    );

Map<String, dynamic> _$$ProvinceLiteModelImplToJson(
        _$ProvinceLiteModelImpl instance) =>
    <String, dynamic>{
      'provinceID': instance.provinceID,
      'provinceName': instance.provinceName,
    };
