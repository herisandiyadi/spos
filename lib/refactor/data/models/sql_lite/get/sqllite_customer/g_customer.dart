import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_customer.freezed.dart';
part 'g_customer.g.dart';

@freezed
class CustomerLiteModel with _$CustomerLiteModel {
  const factory CustomerLiteModel({
    @JsonKey(name: 'customerID') required int customerID,
    @JsonKey(name: 'customerCode') required String customerCode,
    @JsonKey(name: 'fullname') required String fullname,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'mobileNo') String? mobileNo,
    @JsonKey(name: 'birthDate') String? birthDate,
    @JsonKey(name: 'provinceID') int? provinceID,
    @JsonKey(name: 'cityID') int? cityID,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'outletID') required int outletID,
  }) = _CustomerLiteModel;

  factory CustomerLiteModel.fromJson(Map<String, dynamic> json) => _$CustomerLiteModelFromJson(json);
}
