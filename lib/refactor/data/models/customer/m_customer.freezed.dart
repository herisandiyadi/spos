// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CustomerData> get data => throw _privateConstructorUsedError;

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call({String status, String? message, List<CustomerData> data});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerModelImplCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$CustomerModelImplCopyWith(
          _$CustomerModelImpl value, $Res Function(_$CustomerModelImpl) then) =
      __$$CustomerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<CustomerData> data});
}

/// @nodoc
class __$$CustomerModelImplCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$CustomerModelImpl>
    implements _$$CustomerModelImplCopyWith<$Res> {
  __$$CustomerModelImplCopyWithImpl(
      _$CustomerModelImpl _value, $Res Function(_$CustomerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$CustomerModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerModelImpl implements _CustomerModel {
  const _$CustomerModelImpl(
      {required this.status,
      this.message,
      final List<CustomerData> data = const []})
      : _data = data;

  factory _$CustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<CustomerData> _data;
  @override
  @JsonKey()
  List<CustomerData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CustomerModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      __$$CustomerModelImplCopyWithImpl<_$CustomerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {required final String status,
      final String? message,
      final List<CustomerData> data}) = _$CustomerModelImpl;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$CustomerModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<CustomerData> get data;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return _CustomerData.fromJson(json);
}

/// @nodoc
mixin _$CustomerData {
  @JsonKey(name: 'CustomerID')
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fullname')
  String? get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'MobileNo')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'BirthDate')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceID')
  String? get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CityID')
  String? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this CustomerData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerDataCopyWith<CustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDataCopyWith<$Res> {
  factory $CustomerDataCopyWith(
          CustomerData value, $Res Function(CustomerData) then) =
      _$CustomerDataCopyWithImpl<$Res, CustomerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerID') String? customerId,
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
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class _$CustomerDataCopyWithImpl<$Res, $Val extends CustomerData>
    implements $CustomerDataCopyWith<$Res> {
  _$CustomerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerCode = freezed,
    Object? fullname = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? birthDate = freezed,
    Object? password = freezed,
    Object? provinceId = freezed,
    Object? cityId = freezed,
    Object? address = freezed,
    Object? companyCode = freezed,
    Object? outletId = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
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
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerDataImplCopyWith<$Res>
    implements $CustomerDataCopyWith<$Res> {
  factory _$$CustomerDataImplCopyWith(
          _$CustomerDataImpl value, $Res Function(_$CustomerDataImpl) then) =
      __$$CustomerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerID') String? customerId,
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
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class __$$CustomerDataImplCopyWithImpl<$Res>
    extends _$CustomerDataCopyWithImpl<$Res, _$CustomerDataImpl>
    implements _$$CustomerDataImplCopyWith<$Res> {
  __$$CustomerDataImplCopyWithImpl(
      _$CustomerDataImpl _value, $Res Function(_$CustomerDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerCode = freezed,
    Object? fullname = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? birthDate = freezed,
    Object? password = freezed,
    Object? provinceId = freezed,
    Object? cityId = freezed,
    Object? address = freezed,
    Object? companyCode = freezed,
    Object? outletId = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$CustomerDataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
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
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDataImpl implements _CustomerData {
  const _$CustomerDataImpl(
      {@JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'CustomerCode') this.customerCode,
      @JsonKey(name: 'Fullname') this.fullname,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'MobileNo') this.mobileNo,
      @JsonKey(name: 'BirthDate') this.birthDate,
      @JsonKey(name: 'Password') this.password,
      @JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'CityID') this.cityId,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(name: 'OutletID') this.outletId,
      @JsonKey(name: 'is_deleted') this.isDeleted});

  factory _$CustomerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDataImplFromJson(json);

  @override
  @JsonKey(name: 'CustomerID')
  final String? customerId;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'Fullname')
  final String? fullname;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'MobileNo')
  final String? mobileNo;
  @override
  @JsonKey(name: 'BirthDate')
  final String? birthDate;
  @override
  @JsonKey(name: 'Password')
  final String? password;
  @override
  @JsonKey(name: 'ProvinceID')
  final String? provinceId;
  @override
  @JsonKey(name: 'CityID')
  final String? cityId;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletId;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;

  @override
  String toString() {
    return 'CustomerData(customerId: $customerId, customerCode: $customerCode, fullname: $fullname, email: $email, mobileNo: $mobileNo, birthDate: $birthDate, password: $password, provinceId: $provinceId, cityId: $cityId, address: $address, companyCode: $companyCode, outletId: $outletId, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      customerCode,
      fullname,
      email,
      mobileNo,
      birthDate,
      password,
      provinceId,
      cityId,
      address,
      companyCode,
      outletId,
      isDeleted);

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      __$$CustomerDataImplCopyWithImpl<_$CustomerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDataImplToJson(
      this,
    );
  }
}

abstract class _CustomerData implements CustomerData {
  const factory _CustomerData(
          {@JsonKey(name: 'CustomerID') final String? customerId,
          @JsonKey(name: 'CustomerCode') final String? customerCode,
          @JsonKey(name: 'Fullname') final String? fullname,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'MobileNo') final String? mobileNo,
          @JsonKey(name: 'BirthDate') final String? birthDate,
          @JsonKey(name: 'Password') final String? password,
          @JsonKey(name: 'ProvinceID') final String? provinceId,
          @JsonKey(name: 'CityID') final String? cityId,
          @JsonKey(name: 'Address') final String? address,
          @JsonKey(name: 'CompanyCode') final String? companyCode,
          @JsonKey(name: 'OutletID') final String? outletId,
          @JsonKey(name: 'is_deleted') final String? isDeleted}) =
      _$CustomerDataImpl;

  factory _CustomerData.fromJson(Map<String, dynamic> json) =
      _$CustomerDataImpl.fromJson;

  @override
  @JsonKey(name: 'CustomerID')
  String? get customerId;
  @override
  @JsonKey(name: 'CustomerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'Fullname')
  String? get fullname;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'MobileNo')
  String? get mobileNo;
  @override
  @JsonKey(name: 'BirthDate')
  String? get birthDate;
  @override
  @JsonKey(name: 'Password')
  String? get password;
  @override
  @JsonKey(name: 'ProvinceID')
  String? get provinceId;
  @override
  @JsonKey(name: 'CityID')
  String? get cityId;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletId;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
