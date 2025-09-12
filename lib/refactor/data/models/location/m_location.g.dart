// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => LocationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) =>
    _$LocationDataImpl(
      locationID: json['LocationID'] as String?,
      outletID: json['OutletID'] as String?,
      locationCode: json['LocationCode'] as String?,
      locationLabel: json['LocationLabel'] as String?,
      isDeleted: json['is_deleted'] as String?,
    );

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'LocationID': instance.locationID,
      'OutletID': instance.outletID,
      'LocationCode': instance.locationCode,
      'LocationLabel': instance.locationLabel,
      'is_deleted': instance.isDeleted,
    };
