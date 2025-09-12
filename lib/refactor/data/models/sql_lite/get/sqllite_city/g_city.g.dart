// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityLiteModelImpl _$$CityLiteModelImplFromJson(Map<String, dynamic> json) =>
    _$CityLiteModelImpl(
      cityID: (json['cityID'] as num).toInt(),
      provinceID: (json['provinceID'] as num).toInt(),
      cityName: json['cityName'] as String,
    );

Map<String, dynamic> _$$CityLiteModelImplToJson(_$CityLiteModelImpl instance) =>
    <String, dynamic>{
      'cityID': instance.cityID,
      'provinceID': instance.provinceID,
      'cityName': instance.cityName,
    };
