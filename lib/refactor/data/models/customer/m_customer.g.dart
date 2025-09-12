// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$CustomerDataImpl _$$CustomerDataImplFromJson(Map<String, dynamic> json) =>
    _$CustomerDataImpl(
      customerId: json['CustomerID'] as String?,
      customerCode: json['CustomerCode'] as String?,
      fullname: json['Fullname'] as String?,
      email: json['Email'] as String?,
      mobileNo: json['MobileNo'] as String?,
      birthDate: json['BirthDate'] as String?,
      password: json['Password'] as String?,
      provinceId: json['ProvinceID'] as String?,
      cityId: json['CityID'] as String?,
      address: json['Address'] as String?,
      companyCode: json['CompanyCode'] as String?,
      outletId: json['OutletID'] as String?,
      isDeleted: json['is_deleted'] as String?,
    );

Map<String, dynamic> _$$CustomerDataImplToJson(_$CustomerDataImpl instance) =>
    <String, dynamic>{
      'CustomerID': instance.customerId,
      'CustomerCode': instance.customerCode,
      'Fullname': instance.fullname,
      'Email': instance.email,
      'MobileNo': instance.mobileNo,
      'BirthDate': instance.birthDate,
      'Password': instance.password,
      'ProvinceID': instance.provinceId,
      'CityID': instance.cityId,
      'Address': instance.address,
      'CompanyCode': instance.companyCode,
      'OutletID': instance.outletId,
      'is_deleted': instance.isDeleted,
    };
