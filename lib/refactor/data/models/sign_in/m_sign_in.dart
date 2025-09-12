import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_sign_in.freezed.dart';
part 'm_sign_in.g.dart';

SignInModel signInFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInToJson(SignInModel data) => json.encode(data.toJson());

@freezed
class SignInModel with _$SignInModel {
  const factory SignInModel({
    required String status,
    String? message,
    SignInData? data,
    String? token,
  }) = _SignInModel;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}

@freezed
class SignInData with _$SignInData {
  const factory SignInData({
    @JsonKey(name: 'POSLoginID') String? posLoginID,
    @JsonKey(name: 'Username') String? username,
    @JsonKey(name: 'POSName') String? posName,
    @JsonKey(name: 'Outlet') Outlet? outlet,
    @JsonKey(name: 'DataStaff') @Default([]) List<DataStaff> dataStaff,
  }) = _SignInData;

  factory SignInData.fromJson(Map<String, dynamic> json) =>
      _$SignInDataFromJson(json);
}

@freezed
class Outlet with _$Outlet {
  const factory Outlet({
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'OutletCode') String? outletCode,
    @JsonKey(name: 'OutletName') String? outletName,
    @JsonKey(name: 'OutletAddress') String? outletAddress,
    @JsonKey(name: 'OutletImage') String? outletImage,
    @JsonKey(name: 'OutletOpen') String? outletOpen,
    @JsonKey(name: 'OutletClose') String? outletClose,
    @JsonKey(name: 'OutletFB') String? outletFB,
    @JsonKey(name: 'OutletIG') String? outletIG,
    @JsonKey(name: 'OutletTIKTOK') String? outletTIKTOK,
    @JsonKey(name: 'OutletWeb') String? outletWeb,
    @JsonKey(name: 'ApiKey') String? apiKey,
    @JsonKey(name: 'CompanyCode') String? companyCode,
    @JsonKey(name: 'OutletType') String? outletType,
    @JsonKey(name: 'is_deleted') String? isDeleted,
  }) = _Outlet;

  factory Outlet.fromJson(Map<String, dynamic> json) => _$OutletFromJson(json);
}

@freezed
class DataStaff with _$DataStaff {
  const factory DataStaff({
    @JsonKey(name: 'StaffPINID') String? staffPINID,
    @JsonKey(name: 'POSLoginID') String? posLoginID,
    @JsonKey(name: 'NIK') String? nik,
    @JsonKey(name: 'StaffName') String? staffName,
    @JsonKey(name: 'AccessPIN') String? accessPIN,
    @JsonKey(name: 'AuthLevelID') AuthLevelID? authLevelID,
  }) = _DataStaff;

  factory DataStaff.fromJson(Map<String, dynamic> json) =>
      _$DataStaffFromJson(json);
}

@freezed
class AuthLevelID with _$AuthLevelID {
  const factory AuthLevelID({
    @JsonKey(name: 'AuthLevelID') String? authLevelID,
    @JsonKey(name: 'ActionName') String? actionName,
    @JsonKey(name: 'SidebarMenu') String? sidebarMenu,
    @JsonKey(name: 'CompanyCode') String? companyCode,
  }) = _AuthLevelID;

  factory AuthLevelID.fromJson(Map<String, dynamic> json) =>
      _$AuthLevelIDFromJson(json);
}
