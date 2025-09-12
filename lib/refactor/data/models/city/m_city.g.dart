// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CityData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$CityDataImpl _$$CityDataImplFromJson(Map<String, dynamic> json) =>
    _$CityDataImpl(
      arrId: json['ArrID'] as String?,
      cityId: json['CityID'] as String?,
      provinceId: json['ProvinceID'] as String?,
      cityName: json['CityName'] as String?,
    );

Map<String, dynamic> _$$CityDataImplToJson(_$CityDataImpl instance) =>
    <String, dynamic>{
      'ArrID': instance.arrId,
      'CityID': instance.cityId,
      'ProvinceID': instance.provinceId,
      'CityName': instance.cityName,
    };
