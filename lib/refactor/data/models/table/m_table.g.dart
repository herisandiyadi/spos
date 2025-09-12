// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TableData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TableDataImpl _$$TableDataImplFromJson(Map<String, dynamic> json) =>
    _$TableDataImpl(
      tableID: json['TableID'] as String?,
      locationID: json['LocationID'] as String?,
      tableNumber: json['TableNumber'] as String?,
      tableLabel: json['TableLabel'] as String?,
      seat: json['Seat'] as String?,
      isDeleted: json['is_deleted'] as String?,
      outletID: json['OutletID'] as String?,
      locationCode: json['LocationCode'] as String?,
      locationLabel: json['LocationLabel'] as String?,
      outletCode: json['OutletCode'] as String?,
      outletName: json['OutletName'] as String?,
      outletAddress: json['OutletAddress'] as String?,
      outletImage: json['OutletImage'] as String?,
      outletOpen: json['OutletOpen'] as String?,
      outletClose: json['OutletClose'] as String?,
      outletFB: json['OutletFB'] as String?,
      outletIG: json['OutletIG'] as String?,
      outletTiktok: json['OutletTIKTOK'] as String?,
      outletWeb: json['OutletWeb'] as String?,
      apiKey: json['ApiKey'] as String?,
      companyCode: json['CompanyCode'] as String?,
    );

Map<String, dynamic> _$$TableDataImplToJson(_$TableDataImpl instance) =>
    <String, dynamic>{
      'TableID': instance.tableID,
      'LocationID': instance.locationID,
      'TableNumber': instance.tableNumber,
      'TableLabel': instance.tableLabel,
      'Seat': instance.seat,
      'is_deleted': instance.isDeleted,
      'OutletID': instance.outletID,
      'LocationCode': instance.locationCode,
      'LocationLabel': instance.locationLabel,
      'OutletCode': instance.outletCode,
      'OutletName': instance.outletName,
      'OutletAddress': instance.outletAddress,
      'OutletImage': instance.outletImage,
      'OutletOpen': instance.outletOpen,
      'OutletClose': instance.outletClose,
      'OutletFB': instance.outletFB,
      'OutletIG': instance.outletIG,
      'OutletTIKTOK': instance.outletTiktok,
      'OutletWeb': instance.outletWeb,
      'ApiKey': instance.apiKey,
      'CompanyCode': instance.companyCode,
    };
