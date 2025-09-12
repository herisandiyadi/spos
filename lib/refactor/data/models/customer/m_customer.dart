import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_customer.freezed.dart';
part 'm_customer.g.dart';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));
String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required String status,
    String? message,
    @Default([]) List<CustomerData> data,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
}

@freezed
class CustomerData with _$CustomerData {
  const factory CustomerData({
    @JsonKey(name: 'CustomerID') String? customerId,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'Fullname') String? fullname,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'MobileNo') String? mobileNo,
    @JsonKey(name: 'BirthDate') String? birthDate,
    @JsonKey(name: 'Password') String? password,
    @JsonKey(name: 'ProvinceID') String? provinceId,
    @JsonKey(name: 'CityID') String? cityId,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CompanyCode') String? companyCode,
    @JsonKey(name: 'OutletID') String? outletId,
    @JsonKey(name: 'is_deleted') String? isDeleted,
  }) = _CustomerData;

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);
}
