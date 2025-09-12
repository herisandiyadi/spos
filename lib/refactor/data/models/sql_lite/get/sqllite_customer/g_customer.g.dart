// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerLiteModelImpl _$$CustomerLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerLiteModelImpl(
      customerID: (json['customerID'] as num).toInt(),
      customerCode: json['customerCode'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String?,
      mobileNo: json['mobileNo'] as String?,
      birthDate: json['birthDate'] as String?,
      provinceID: (json['provinceID'] as num?)?.toInt(),
      cityID: (json['cityID'] as num?)?.toInt(),
      address: json['address'] as String?,
      outletID: (json['outletID'] as num).toInt(),
    );

Map<String, dynamic> _$$CustomerLiteModelImplToJson(
        _$CustomerLiteModelImpl instance) =>
    <String, dynamic>{
      'customerID': instance.customerID,
      'customerCode': instance.customerCode,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'birthDate': instance.birthDate,
      'provinceID': instance.provinceID,
      'cityID': instance.cityID,
      'address': instance.address,
      'outletID': instance.outletID,
    };
