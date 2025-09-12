// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerLiteModel _$CustomerLiteModelFromJson(Map<String, dynamic> json) {
  return _CustomerLiteModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerLiteModel {
  @JsonKey(name: 'customerID')
  int get customerID => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullname')
  String get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNo')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthDate')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'provinceID')
  int? get provinceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'cityID')
  int? get cityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletID')
  int get outletID => throw _privateConstructorUsedError;

  /// Serializes this CustomerLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerLiteModelCopyWith<CustomerLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLiteModelCopyWith<$Res> {
  factory $CustomerLiteModelCopyWith(
          CustomerLiteModel value, $Res Function(CustomerLiteModel) then) =
      _$CustomerLiteModelCopyWithImpl<$Res, CustomerLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String customerCode,
      @JsonKey(name: 'fullname') String fullname,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'mobileNo') String? mobileNo,
      @JsonKey(name: 'birthDate') String? birthDate,
      @JsonKey(name: 'provinceID') int? provinceID,
      @JsonKey(name: 'cityID') int? cityID,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'outletID') int outletID});
}

/// @nodoc
class _$CustomerLiteModelCopyWithImpl<$Res, $Val extends CustomerLiteModel>
    implements $CustomerLiteModelCopyWith<$Res> {
  _$CustomerLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerID = null,
    Object? customerCode = null,
    Object? fullname = null,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? birthDate = freezed,
    Object? provinceID = freezed,
    Object? cityID = freezed,
    Object? address = freezed,
    Object? outletID = null,
  }) {
    return _then(_value.copyWith(
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceID: freezed == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int?,
      cityID: freezed == cityID
          ? _value.cityID
          : cityID // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerLiteModelImplCopyWith<$Res>
    implements $CustomerLiteModelCopyWith<$Res> {
  factory _$$CustomerLiteModelImplCopyWith(_$CustomerLiteModelImpl value,
          $Res Function(_$CustomerLiteModelImpl) then) =
      __$$CustomerLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String customerCode,
      @JsonKey(name: 'fullname') String fullname,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'mobileNo') String? mobileNo,
      @JsonKey(name: 'birthDate') String? birthDate,
      @JsonKey(name: 'provinceID') int? provinceID,
      @JsonKey(name: 'cityID') int? cityID,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'outletID') int outletID});
}

/// @nodoc
class __$$CustomerLiteModelImplCopyWithImpl<$Res>
    extends _$CustomerLiteModelCopyWithImpl<$Res, _$CustomerLiteModelImpl>
    implements _$$CustomerLiteModelImplCopyWith<$Res> {
  __$$CustomerLiteModelImplCopyWithImpl(_$CustomerLiteModelImpl _value,
      $Res Function(_$CustomerLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerID = null,
    Object? customerCode = null,
    Object? fullname = null,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? birthDate = freezed,
    Object? provinceID = freezed,
    Object? cityID = freezed,
    Object? address = freezed,
    Object? outletID = null,
  }) {
    return _then(_$CustomerLiteModelImpl(
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceID: freezed == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int?,
      cityID: freezed == cityID
          ? _value.cityID
          : cityID // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerLiteModelImpl implements _CustomerLiteModel {
  const _$CustomerLiteModelImpl(
      {@JsonKey(name: 'customerID') required this.customerID,
      @JsonKey(name: 'customerCode') required this.customerCode,
      @JsonKey(name: 'fullname') required this.fullname,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'mobileNo') this.mobileNo,
      @JsonKey(name: 'birthDate') this.birthDate,
      @JsonKey(name: 'provinceID') this.provinceID,
      @JsonKey(name: 'cityID') this.cityID,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'outletID') required this.outletID});

  factory _$CustomerLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'customerID')
  final int customerID;
  @override
  @JsonKey(name: 'customerCode')
  final String customerCode;
  @override
  @JsonKey(name: 'fullname')
  final String fullname;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'mobileNo')
  final String? mobileNo;
  @override
  @JsonKey(name: 'birthDate')
  final String? birthDate;
  @override
  @JsonKey(name: 'provinceID')
  final int? provinceID;
  @override
  @JsonKey(name: 'cityID')
  final int? cityID;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'outletID')
  final int outletID;

  @override
  String toString() {
    return 'CustomerLiteModel(customerID: $customerID, customerCode: $customerCode, fullname: $fullname, email: $email, mobileNo: $mobileNo, birthDate: $birthDate, provinceID: $provinceID, cityID: $cityID, address: $address, outletID: $outletID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLiteModelImpl &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.provinceID, provinceID) ||
                other.provinceID == provinceID) &&
            (identical(other.cityID, cityID) || other.cityID == cityID) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerID,
      customerCode,
      fullname,
      email,
      mobileNo,
      birthDate,
      provinceID,
      cityID,
      address,
      outletID);

  /// Create a copy of CustomerLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLiteModelImplCopyWith<_$CustomerLiteModelImpl> get copyWith =>
      __$$CustomerLiteModelImplCopyWithImpl<_$CustomerLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerLiteModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerLiteModel implements CustomerLiteModel {
  const factory _CustomerLiteModel(
          {@JsonKey(name: 'customerID') required final int customerID,
          @JsonKey(name: 'customerCode') required final String customerCode,
          @JsonKey(name: 'fullname') required final String fullname,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'mobileNo') final String? mobileNo,
          @JsonKey(name: 'birthDate') final String? birthDate,
          @JsonKey(name: 'provinceID') final int? provinceID,
          @JsonKey(name: 'cityID') final int? cityID,
          @JsonKey(name: 'address') final String? address,
          @JsonKey(name: 'outletID') required final int outletID}) =
      _$CustomerLiteModelImpl;

  factory _CustomerLiteModel.fromJson(Map<String, dynamic> json) =
      _$CustomerLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'customerID')
  int get customerID;
  @override
  @JsonKey(name: 'customerCode')
  String get customerCode;
  @override
  @JsonKey(name: 'fullname')
  String get fullname;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'mobileNo')
  String? get mobileNo;
  @override
  @JsonKey(name: 'birthDate')
  String? get birthDate;
  @override
  @JsonKey(name: 'provinceID')
  int? get provinceID;
  @override
  @JsonKey(name: 'cityID')
  int? get cityID;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'outletID')
  int get outletID;

  /// Create a copy of CustomerLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerLiteModelImplCopyWith<_$CustomerLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
