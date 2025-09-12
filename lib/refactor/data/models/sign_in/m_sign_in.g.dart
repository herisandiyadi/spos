// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInModelImpl _$$SignInModelImplFromJson(Map<String, dynamic> json) =>
    _$SignInModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SignInData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$SignInModelImplToJson(_$SignInModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };

_$SignInDataImpl _$$SignInDataImplFromJson(Map<String, dynamic> json) =>
    _$SignInDataImpl(
      posLoginID: json['POSLoginID'] as String?,
      username: json['Username'] as String?,
      posName: json['POSName'] as String?,
      outlet: json['Outlet'] == null
          ? null
          : Outlet.fromJson(json['Outlet'] as Map<String, dynamic>),
      dataStaff: (json['DataStaff'] as List<dynamic>?)
              ?.map((e) => DataStaff.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SignInDataImplToJson(_$SignInDataImpl instance) =>
    <String, dynamic>{
      'POSLoginID': instance.posLoginID,
      'Username': instance.username,
      'POSName': instance.posName,
      'Outlet': instance.outlet,
      'DataStaff': instance.dataStaff,
    };

_$OutletImpl _$$OutletImplFromJson(Map<String, dynamic> json) => _$OutletImpl(
      outletID: json['OutletID'] as String?,
      outletCode: json['OutletCode'] as String?,
      outletName: json['OutletName'] as String?,
      outletAddress: json['OutletAddress'] as String?,
      outletImage: json['OutletImage'] as String?,
      outletOpen: json['OutletOpen'] as String?,
      outletClose: json['OutletClose'] as String?,
      outletFB: json['OutletFB'] as String?,
      outletIG: json['OutletIG'] as String?,
      outletTIKTOK: json['OutletTIKTOK'] as String?,
      outletWeb: json['OutletWeb'] as String?,
      apiKey: json['ApiKey'] as String?,
      companyCode: json['CompanyCode'] as String?,
      outletType: json['OutletType'] as String?,
      isDeleted: json['is_deleted'] as String?,
    );

Map<String, dynamic> _$$OutletImplToJson(_$OutletImpl instance) =>
    <String, dynamic>{
      'OutletID': instance.outletID,
      'OutletCode': instance.outletCode,
      'OutletName': instance.outletName,
      'OutletAddress': instance.outletAddress,
      'OutletImage': instance.outletImage,
      'OutletOpen': instance.outletOpen,
      'OutletClose': instance.outletClose,
      'OutletFB': instance.outletFB,
      'OutletIG': instance.outletIG,
      'OutletTIKTOK': instance.outletTIKTOK,
      'OutletWeb': instance.outletWeb,
      'ApiKey': instance.apiKey,
      'CompanyCode': instance.companyCode,
      'OutletType': instance.outletType,
      'is_deleted': instance.isDeleted,
    };

_$DataStaffImpl _$$DataStaffImplFromJson(Map<String, dynamic> json) =>
    _$DataStaffImpl(
      staffPINID: json['StaffPINID'] as String?,
      posLoginID: json['POSLoginID'] as String?,
      nik: json['NIK'] as String?,
      staffName: json['StaffName'] as String?,
      accessPIN: json['AccessPIN'] as String?,
      authLevelID: json['AuthLevelID'] == null
          ? null
          : AuthLevelID.fromJson(json['AuthLevelID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataStaffImplToJson(_$DataStaffImpl instance) =>
    <String, dynamic>{
      'StaffPINID': instance.staffPINID,
      'POSLoginID': instance.posLoginID,
      'NIK': instance.nik,
      'StaffName': instance.staffName,
      'AccessPIN': instance.accessPIN,
      'AuthLevelID': instance.authLevelID,
    };

_$AuthLevelIDImpl _$$AuthLevelIDImplFromJson(Map<String, dynamic> json) =>
    _$AuthLevelIDImpl(
      authLevelID: json['AuthLevelID'] as String?,
      actionName: json['ActionName'] as String?,
      sidebarMenu: json['SidebarMenu'] as String?,
      companyCode: json['CompanyCode'] as String?,
    );

Map<String, dynamic> _$$AuthLevelIDImplToJson(_$AuthLevelIDImpl instance) =>
    <String, dynamic>{
      'AuthLevelID': instance.authLevelID,
      'ActionName': instance.actionName,
      'SidebarMenu': instance.sidebarMenu,
      'CompanyCode': instance.companyCode,
    };
