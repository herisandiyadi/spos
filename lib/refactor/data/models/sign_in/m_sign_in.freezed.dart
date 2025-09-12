// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) {
  return _SignInModel.fromJson(json);
}

/// @nodoc
mixin _$SignInModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SignInData? get data => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this SignInModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInModelCopyWith<SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInModelCopyWith<$Res> {
  factory $SignInModelCopyWith(
          SignInModel value, $Res Function(SignInModel) then) =
      _$SignInModelCopyWithImpl<$Res, SignInModel>;
  @useResult
  $Res call({String status, String? message, SignInData? data, String? token});

  $SignInDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SignInModelCopyWithImpl<$Res, $Val extends SignInModel>
    implements $SignInModelCopyWith<$Res> {
  _$SignInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? token = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignInData?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignInDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SignInDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInModelImplCopyWith<$Res>
    implements $SignInModelCopyWith<$Res> {
  factory _$$SignInModelImplCopyWith(
          _$SignInModelImpl value, $Res Function(_$SignInModelImpl) then) =
      __$$SignInModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, SignInData? data, String? token});

  @override
  $SignInDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SignInModelImplCopyWithImpl<$Res>
    extends _$SignInModelCopyWithImpl<$Res, _$SignInModelImpl>
    implements _$$SignInModelImplCopyWith<$Res> {
  __$$SignInModelImplCopyWithImpl(
      _$SignInModelImpl _value, $Res Function(_$SignInModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? token = freezed,
  }) {
    return _then(_$SignInModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignInData?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInModelImpl implements _SignInModel {
  const _$SignInModelImpl(
      {required this.status, this.message, this.data, this.token});

  factory _$SignInModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  @override
  final SignInData? data;
  @override
  final String? token;

  @override
  String toString() {
    return 'SignInModel(status: $status, message: $message, data: $data, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, token);

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInModelImplCopyWith<_$SignInModelImpl> get copyWith =>
      __$$SignInModelImplCopyWithImpl<_$SignInModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInModelImplToJson(
      this,
    );
  }
}

abstract class _SignInModel implements SignInModel {
  const factory _SignInModel(
      {required final String status,
      final String? message,
      final SignInData? data,
      final String? token}) = _$SignInModelImpl;

  factory _SignInModel.fromJson(Map<String, dynamic> json) =
      _$SignInModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  SignInData? get data;
  @override
  String? get token;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInModelImplCopyWith<_$SignInModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignInData _$SignInDataFromJson(Map<String, dynamic> json) {
  return _SignInData.fromJson(json);
}

/// @nodoc
mixin _$SignInData {
  @JsonKey(name: 'POSLoginID')
  String? get posLoginID => throw _privateConstructorUsedError;
  @JsonKey(name: 'Username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSName')
  String? get posName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Outlet')
  Outlet? get outlet => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataStaff')
  List<DataStaff> get dataStaff => throw _privateConstructorUsedError;

  /// Serializes this SignInData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInDataCopyWith<SignInData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInDataCopyWith<$Res> {
  factory $SignInDataCopyWith(
          SignInData value, $Res Function(SignInData) then) =
      _$SignInDataCopyWithImpl<$Res, SignInData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'POSLoginID') String? posLoginID,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'POSName') String? posName,
      @JsonKey(name: 'Outlet') Outlet? outlet,
      @JsonKey(name: 'DataStaff') List<DataStaff> dataStaff});

  $OutletCopyWith<$Res>? get outlet;
}

/// @nodoc
class _$SignInDataCopyWithImpl<$Res, $Val extends SignInData>
    implements $SignInDataCopyWith<$Res> {
  _$SignInDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posLoginID = freezed,
    Object? username = freezed,
    Object? posName = freezed,
    Object? outlet = freezed,
    Object? dataStaff = null,
  }) {
    return _then(_value.copyWith(
      posLoginID: freezed == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      posName: freezed == posName
          ? _value.posName
          : posName // ignore: cast_nullable_to_non_nullable
              as String?,
      outlet: freezed == outlet
          ? _value.outlet
          : outlet // ignore: cast_nullable_to_non_nullable
              as Outlet?,
      dataStaff: null == dataStaff
          ? _value.dataStaff
          : dataStaff // ignore: cast_nullable_to_non_nullable
              as List<DataStaff>,
    ) as $Val);
  }

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutletCopyWith<$Res>? get outlet {
    if (_value.outlet == null) {
      return null;
    }

    return $OutletCopyWith<$Res>(_value.outlet!, (value) {
      return _then(_value.copyWith(outlet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInDataImplCopyWith<$Res>
    implements $SignInDataCopyWith<$Res> {
  factory _$$SignInDataImplCopyWith(
          _$SignInDataImpl value, $Res Function(_$SignInDataImpl) then) =
      __$$SignInDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'POSLoginID') String? posLoginID,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'POSName') String? posName,
      @JsonKey(name: 'Outlet') Outlet? outlet,
      @JsonKey(name: 'DataStaff') List<DataStaff> dataStaff});

  @override
  $OutletCopyWith<$Res>? get outlet;
}

/// @nodoc
class __$$SignInDataImplCopyWithImpl<$Res>
    extends _$SignInDataCopyWithImpl<$Res, _$SignInDataImpl>
    implements _$$SignInDataImplCopyWith<$Res> {
  __$$SignInDataImplCopyWithImpl(
      _$SignInDataImpl _value, $Res Function(_$SignInDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posLoginID = freezed,
    Object? username = freezed,
    Object? posName = freezed,
    Object? outlet = freezed,
    Object? dataStaff = null,
  }) {
    return _then(_$SignInDataImpl(
      posLoginID: freezed == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      posName: freezed == posName
          ? _value.posName
          : posName // ignore: cast_nullable_to_non_nullable
              as String?,
      outlet: freezed == outlet
          ? _value.outlet
          : outlet // ignore: cast_nullable_to_non_nullable
              as Outlet?,
      dataStaff: null == dataStaff
          ? _value._dataStaff
          : dataStaff // ignore: cast_nullable_to_non_nullable
              as List<DataStaff>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInDataImpl implements _SignInData {
  const _$SignInDataImpl(
      {@JsonKey(name: 'POSLoginID') this.posLoginID,
      @JsonKey(name: 'Username') this.username,
      @JsonKey(name: 'POSName') this.posName,
      @JsonKey(name: 'Outlet') this.outlet,
      @JsonKey(name: 'DataStaff') final List<DataStaff> dataStaff = const []})
      : _dataStaff = dataStaff;

  factory _$SignInDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInDataImplFromJson(json);

  @override
  @JsonKey(name: 'POSLoginID')
  final String? posLoginID;
  @override
  @JsonKey(name: 'Username')
  final String? username;
  @override
  @JsonKey(name: 'POSName')
  final String? posName;
  @override
  @JsonKey(name: 'Outlet')
  final Outlet? outlet;
  final List<DataStaff> _dataStaff;
  @override
  @JsonKey(name: 'DataStaff')
  List<DataStaff> get dataStaff {
    if (_dataStaff is EqualUnmodifiableListView) return _dataStaff;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataStaff);
  }

  @override
  String toString() {
    return 'SignInData(posLoginID: $posLoginID, username: $username, posName: $posName, outlet: $outlet, dataStaff: $dataStaff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInDataImpl &&
            (identical(other.posLoginID, posLoginID) ||
                other.posLoginID == posLoginID) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.posName, posName) || other.posName == posName) &&
            (identical(other.outlet, outlet) || other.outlet == outlet) &&
            const DeepCollectionEquality()
                .equals(other._dataStaff, _dataStaff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, posLoginID, username, posName,
      outlet, const DeepCollectionEquality().hash(_dataStaff));

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInDataImplCopyWith<_$SignInDataImpl> get copyWith =>
      __$$SignInDataImplCopyWithImpl<_$SignInDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInDataImplToJson(
      this,
    );
  }
}

abstract class _SignInData implements SignInData {
  const factory _SignInData(
          {@JsonKey(name: 'POSLoginID') final String? posLoginID,
          @JsonKey(name: 'Username') final String? username,
          @JsonKey(name: 'POSName') final String? posName,
          @JsonKey(name: 'Outlet') final Outlet? outlet,
          @JsonKey(name: 'DataStaff') final List<DataStaff> dataStaff}) =
      _$SignInDataImpl;

  factory _SignInData.fromJson(Map<String, dynamic> json) =
      _$SignInDataImpl.fromJson;

  @override
  @JsonKey(name: 'POSLoginID')
  String? get posLoginID;
  @override
  @JsonKey(name: 'Username')
  String? get username;
  @override
  @JsonKey(name: 'POSName')
  String? get posName;
  @override
  @JsonKey(name: 'Outlet')
  Outlet? get outlet;
  @override
  @JsonKey(name: 'DataStaff')
  List<DataStaff> get dataStaff;

  /// Create a copy of SignInData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInDataImplCopyWith<_$SignInDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Outlet _$OutletFromJson(Map<String, dynamic> json) {
  return _Outlet.fromJson(json);
}

/// @nodoc
mixin _$Outlet {
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletCode')
  String? get outletCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletName')
  String? get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletImage')
  String? get outletImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletClose')
  String? get outletClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletFB')
  String? get outletFB => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletIG')
  String? get outletIG => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTIKTOK => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApiKey')
  String? get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletType')
  String? get outletType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this Outlet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletCopyWith<Outlet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletCopyWith<$Res> {
  factory $OutletCopyWith(Outlet value, $Res Function(Outlet) then) =
      _$OutletCopyWithImpl<$Res, Outlet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OutletID') String? outletID,
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
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class _$OutletCopyWithImpl<$Res, $Val extends Outlet>
    implements $OutletCopyWith<$Res> {
  _$OutletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletID = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTIKTOK = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
    Object? outletType = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTIKTOK: freezed == outletTIKTOK
          ? _value.outletTIKTOK
          : outletTIKTOK // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletType: freezed == outletType
          ? _value.outletType
          : outletType // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletImplCopyWith<$Res> implements $OutletCopyWith<$Res> {
  factory _$$OutletImplCopyWith(
          _$OutletImpl value, $Res Function(_$OutletImpl) then) =
      __$$OutletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OutletID') String? outletID,
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
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class __$$OutletImplCopyWithImpl<$Res>
    extends _$OutletCopyWithImpl<$Res, _$OutletImpl>
    implements _$$OutletImplCopyWith<$Res> {
  __$$OutletImplCopyWithImpl(
      _$OutletImpl _value, $Res Function(_$OutletImpl) _then)
      : super(_value, _then);

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletID = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTIKTOK = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
    Object? outletType = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$OutletImpl(
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTIKTOK: freezed == outletTIKTOK
          ? _value.outletTIKTOK
          : outletTIKTOK // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletType: freezed == outletType
          ? _value.outletType
          : outletType // ignore: cast_nullable_to_non_nullable
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
class _$OutletImpl implements _Outlet {
  const _$OutletImpl(
      {@JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'OutletCode') this.outletCode,
      @JsonKey(name: 'OutletName') this.outletName,
      @JsonKey(name: 'OutletAddress') this.outletAddress,
      @JsonKey(name: 'OutletImage') this.outletImage,
      @JsonKey(name: 'OutletOpen') this.outletOpen,
      @JsonKey(name: 'OutletClose') this.outletClose,
      @JsonKey(name: 'OutletFB') this.outletFB,
      @JsonKey(name: 'OutletIG') this.outletIG,
      @JsonKey(name: 'OutletTIKTOK') this.outletTIKTOK,
      @JsonKey(name: 'OutletWeb') this.outletWeb,
      @JsonKey(name: 'ApiKey') this.apiKey,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(name: 'OutletType') this.outletType,
      @JsonKey(name: 'is_deleted') this.isDeleted});

  factory _$OutletImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletImplFromJson(json);

  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'OutletCode')
  final String? outletCode;
  @override
  @JsonKey(name: 'OutletName')
  final String? outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  final String? outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  final String? outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  final String? outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  final String? outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  final String? outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  final String? outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  final String? outletTIKTOK;
  @override
  @JsonKey(name: 'OutletWeb')
  final String? outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  final String? apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  @override
  @JsonKey(name: 'OutletType')
  final String? outletType;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;

  @override
  String toString() {
    return 'Outlet(outletID: $outletID, outletCode: $outletCode, outletName: $outletName, outletAddress: $outletAddress, outletImage: $outletImage, outletOpen: $outletOpen, outletClose: $outletClose, outletFB: $outletFB, outletIG: $outletIG, outletTIKTOK: $outletTIKTOK, outletWeb: $outletWeb, apiKey: $apiKey, companyCode: $companyCode, outletType: $outletType, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletImpl &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletAddress, outletAddress) ||
                other.outletAddress == outletAddress) &&
            (identical(other.outletImage, outletImage) ||
                other.outletImage == outletImage) &&
            (identical(other.outletOpen, outletOpen) ||
                other.outletOpen == outletOpen) &&
            (identical(other.outletClose, outletClose) ||
                other.outletClose == outletClose) &&
            (identical(other.outletFB, outletFB) ||
                other.outletFB == outletFB) &&
            (identical(other.outletIG, outletIG) ||
                other.outletIG == outletIG) &&
            (identical(other.outletTIKTOK, outletTIKTOK) ||
                other.outletTIKTOK == outletTIKTOK) &&
            (identical(other.outletWeb, outletWeb) ||
                other.outletWeb == outletWeb) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.outletType, outletType) ||
                other.outletType == outletType) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      outletID,
      outletCode,
      outletName,
      outletAddress,
      outletImage,
      outletOpen,
      outletClose,
      outletFB,
      outletIG,
      outletTIKTOK,
      outletWeb,
      apiKey,
      companyCode,
      outletType,
      isDeleted);

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletImplCopyWith<_$OutletImpl> get copyWith =>
      __$$OutletImplCopyWithImpl<_$OutletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletImplToJson(
      this,
    );
  }
}

abstract class _Outlet implements Outlet {
  const factory _Outlet(
      {@JsonKey(name: 'OutletID') final String? outletID,
      @JsonKey(name: 'OutletCode') final String? outletCode,
      @JsonKey(name: 'OutletName') final String? outletName,
      @JsonKey(name: 'OutletAddress') final String? outletAddress,
      @JsonKey(name: 'OutletImage') final String? outletImage,
      @JsonKey(name: 'OutletOpen') final String? outletOpen,
      @JsonKey(name: 'OutletClose') final String? outletClose,
      @JsonKey(name: 'OutletFB') final String? outletFB,
      @JsonKey(name: 'OutletIG') final String? outletIG,
      @JsonKey(name: 'OutletTIKTOK') final String? outletTIKTOK,
      @JsonKey(name: 'OutletWeb') final String? outletWeb,
      @JsonKey(name: 'ApiKey') final String? apiKey,
      @JsonKey(name: 'CompanyCode') final String? companyCode,
      @JsonKey(name: 'OutletType') final String? outletType,
      @JsonKey(name: 'is_deleted') final String? isDeleted}) = _$OutletImpl;

  factory _Outlet.fromJson(Map<String, dynamic> json) = _$OutletImpl.fromJson;

  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'OutletCode')
  String? get outletCode;
  @override
  @JsonKey(name: 'OutletName')
  String? get outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  String? get outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  String? get outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  String? get outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  String? get outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTIKTOK;
  @override
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  String? get apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'OutletType')
  String? get outletType;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletImplCopyWith<_$OutletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataStaff _$DataStaffFromJson(Map<String, dynamic> json) {
  return _DataStaff.fromJson(json);
}

/// @nodoc
mixin _$DataStaff {
  @JsonKey(name: 'StaffPINID')
  String? get staffPINID => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSLoginID')
  String? get posLoginID => throw _privateConstructorUsedError;
  @JsonKey(name: 'NIK')
  String? get nik => throw _privateConstructorUsedError;
  @JsonKey(name: 'StaffName')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccessPIN')
  String? get accessPIN => throw _privateConstructorUsedError;
  @JsonKey(name: 'AuthLevelID')
  AuthLevelID? get authLevelID => throw _privateConstructorUsedError;

  /// Serializes this DataStaff to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataStaffCopyWith<DataStaff> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStaffCopyWith<$Res> {
  factory $DataStaffCopyWith(DataStaff value, $Res Function(DataStaff) then) =
      _$DataStaffCopyWithImpl<$Res, DataStaff>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StaffPINID') String? staffPINID,
      @JsonKey(name: 'POSLoginID') String? posLoginID,
      @JsonKey(name: 'NIK') String? nik,
      @JsonKey(name: 'StaffName') String? staffName,
      @JsonKey(name: 'AccessPIN') String? accessPIN,
      @JsonKey(name: 'AuthLevelID') AuthLevelID? authLevelID});

  $AuthLevelIDCopyWith<$Res>? get authLevelID;
}

/// @nodoc
class _$DataStaffCopyWithImpl<$Res, $Val extends DataStaff>
    implements $DataStaffCopyWith<$Res> {
  _$DataStaffCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffPINID = freezed,
    Object? posLoginID = freezed,
    Object? nik = freezed,
    Object? staffName = freezed,
    Object? accessPIN = freezed,
    Object? authLevelID = freezed,
  }) {
    return _then(_value.copyWith(
      staffPINID: freezed == staffPINID
          ? _value.staffPINID
          : staffPINID // ignore: cast_nullable_to_non_nullable
              as String?,
      posLoginID: freezed == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: freezed == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      accessPIN: freezed == accessPIN
          ? _value.accessPIN
          : accessPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      authLevelID: freezed == authLevelID
          ? _value.authLevelID
          : authLevelID // ignore: cast_nullable_to_non_nullable
              as AuthLevelID?,
    ) as $Val);
  }

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthLevelIDCopyWith<$Res>? get authLevelID {
    if (_value.authLevelID == null) {
      return null;
    }

    return $AuthLevelIDCopyWith<$Res>(_value.authLevelID!, (value) {
      return _then(_value.copyWith(authLevelID: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataStaffImplCopyWith<$Res>
    implements $DataStaffCopyWith<$Res> {
  factory _$$DataStaffImplCopyWith(
          _$DataStaffImpl value, $Res Function(_$DataStaffImpl) then) =
      __$$DataStaffImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StaffPINID') String? staffPINID,
      @JsonKey(name: 'POSLoginID') String? posLoginID,
      @JsonKey(name: 'NIK') String? nik,
      @JsonKey(name: 'StaffName') String? staffName,
      @JsonKey(name: 'AccessPIN') String? accessPIN,
      @JsonKey(name: 'AuthLevelID') AuthLevelID? authLevelID});

  @override
  $AuthLevelIDCopyWith<$Res>? get authLevelID;
}

/// @nodoc
class __$$DataStaffImplCopyWithImpl<$Res>
    extends _$DataStaffCopyWithImpl<$Res, _$DataStaffImpl>
    implements _$$DataStaffImplCopyWith<$Res> {
  __$$DataStaffImplCopyWithImpl(
      _$DataStaffImpl _value, $Res Function(_$DataStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffPINID = freezed,
    Object? posLoginID = freezed,
    Object? nik = freezed,
    Object? staffName = freezed,
    Object? accessPIN = freezed,
    Object? authLevelID = freezed,
  }) {
    return _then(_$DataStaffImpl(
      staffPINID: freezed == staffPINID
          ? _value.staffPINID
          : staffPINID // ignore: cast_nullable_to_non_nullable
              as String?,
      posLoginID: freezed == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: freezed == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      accessPIN: freezed == accessPIN
          ? _value.accessPIN
          : accessPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      authLevelID: freezed == authLevelID
          ? _value.authLevelID
          : authLevelID // ignore: cast_nullable_to_non_nullable
              as AuthLevelID?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataStaffImpl implements _DataStaff {
  const _$DataStaffImpl(
      {@JsonKey(name: 'StaffPINID') this.staffPINID,
      @JsonKey(name: 'POSLoginID') this.posLoginID,
      @JsonKey(name: 'NIK') this.nik,
      @JsonKey(name: 'StaffName') this.staffName,
      @JsonKey(name: 'AccessPIN') this.accessPIN,
      @JsonKey(name: 'AuthLevelID') this.authLevelID});

  factory _$DataStaffImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataStaffImplFromJson(json);

  @override
  @JsonKey(name: 'StaffPINID')
  final String? staffPINID;
  @override
  @JsonKey(name: 'POSLoginID')
  final String? posLoginID;
  @override
  @JsonKey(name: 'NIK')
  final String? nik;
  @override
  @JsonKey(name: 'StaffName')
  final String? staffName;
  @override
  @JsonKey(name: 'AccessPIN')
  final String? accessPIN;
  @override
  @JsonKey(name: 'AuthLevelID')
  final AuthLevelID? authLevelID;

  @override
  String toString() {
    return 'DataStaff(staffPINID: $staffPINID, posLoginID: $posLoginID, nik: $nik, staffName: $staffName, accessPIN: $accessPIN, authLevelID: $authLevelID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStaffImpl &&
            (identical(other.staffPINID, staffPINID) ||
                other.staffPINID == staffPINID) &&
            (identical(other.posLoginID, posLoginID) ||
                other.posLoginID == posLoginID) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.accessPIN, accessPIN) ||
                other.accessPIN == accessPIN) &&
            (identical(other.authLevelID, authLevelID) ||
                other.authLevelID == authLevelID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, staffPINID, posLoginID, nik,
      staffName, accessPIN, authLevelID);

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataStaffImplCopyWith<_$DataStaffImpl> get copyWith =>
      __$$DataStaffImplCopyWithImpl<_$DataStaffImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataStaffImplToJson(
      this,
    );
  }
}

abstract class _DataStaff implements DataStaff {
  const factory _DataStaff(
          {@JsonKey(name: 'StaffPINID') final String? staffPINID,
          @JsonKey(name: 'POSLoginID') final String? posLoginID,
          @JsonKey(name: 'NIK') final String? nik,
          @JsonKey(name: 'StaffName') final String? staffName,
          @JsonKey(name: 'AccessPIN') final String? accessPIN,
          @JsonKey(name: 'AuthLevelID') final AuthLevelID? authLevelID}) =
      _$DataStaffImpl;

  factory _DataStaff.fromJson(Map<String, dynamic> json) =
      _$DataStaffImpl.fromJson;

  @override
  @JsonKey(name: 'StaffPINID')
  String? get staffPINID;
  @override
  @JsonKey(name: 'POSLoginID')
  String? get posLoginID;
  @override
  @JsonKey(name: 'NIK')
  String? get nik;
  @override
  @JsonKey(name: 'StaffName')
  String? get staffName;
  @override
  @JsonKey(name: 'AccessPIN')
  String? get accessPIN;
  @override
  @JsonKey(name: 'AuthLevelID')
  AuthLevelID? get authLevelID;

  /// Create a copy of DataStaff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataStaffImplCopyWith<_$DataStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthLevelID _$AuthLevelIDFromJson(Map<String, dynamic> json) {
  return _AuthLevelID.fromJson(json);
}

/// @nodoc
mixin _$AuthLevelID {
  @JsonKey(name: 'AuthLevelID')
  String? get authLevelID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActionName')
  String? get actionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SidebarMenu')
  String? get sidebarMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;

  /// Serializes this AuthLevelID to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthLevelID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthLevelIDCopyWith<AuthLevelID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLevelIDCopyWith<$Res> {
  factory $AuthLevelIDCopyWith(
          AuthLevelID value, $Res Function(AuthLevelID) then) =
      _$AuthLevelIDCopyWithImpl<$Res, AuthLevelID>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AuthLevelID') String? authLevelID,
      @JsonKey(name: 'ActionName') String? actionName,
      @JsonKey(name: 'SidebarMenu') String? sidebarMenu,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class _$AuthLevelIDCopyWithImpl<$Res, $Val extends AuthLevelID>
    implements $AuthLevelIDCopyWith<$Res> {
  _$AuthLevelIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthLevelID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authLevelID = freezed,
    Object? actionName = freezed,
    Object? sidebarMenu = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_value.copyWith(
      authLevelID: freezed == authLevelID
          ? _value.authLevelID
          : authLevelID // ignore: cast_nullable_to_non_nullable
              as String?,
      actionName: freezed == actionName
          ? _value.actionName
          : actionName // ignore: cast_nullable_to_non_nullable
              as String?,
      sidebarMenu: freezed == sidebarMenu
          ? _value.sidebarMenu
          : sidebarMenu // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthLevelIDImplCopyWith<$Res>
    implements $AuthLevelIDCopyWith<$Res> {
  factory _$$AuthLevelIDImplCopyWith(
          _$AuthLevelIDImpl value, $Res Function(_$AuthLevelIDImpl) then) =
      __$$AuthLevelIDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AuthLevelID') String? authLevelID,
      @JsonKey(name: 'ActionName') String? actionName,
      @JsonKey(name: 'SidebarMenu') String? sidebarMenu,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class __$$AuthLevelIDImplCopyWithImpl<$Res>
    extends _$AuthLevelIDCopyWithImpl<$Res, _$AuthLevelIDImpl>
    implements _$$AuthLevelIDImplCopyWith<$Res> {
  __$$AuthLevelIDImplCopyWithImpl(
      _$AuthLevelIDImpl _value, $Res Function(_$AuthLevelIDImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthLevelID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authLevelID = freezed,
    Object? actionName = freezed,
    Object? sidebarMenu = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_$AuthLevelIDImpl(
      authLevelID: freezed == authLevelID
          ? _value.authLevelID
          : authLevelID // ignore: cast_nullable_to_non_nullable
              as String?,
      actionName: freezed == actionName
          ? _value.actionName
          : actionName // ignore: cast_nullable_to_non_nullable
              as String?,
      sidebarMenu: freezed == sidebarMenu
          ? _value.sidebarMenu
          : sidebarMenu // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthLevelIDImpl implements _AuthLevelID {
  const _$AuthLevelIDImpl(
      {@JsonKey(name: 'AuthLevelID') this.authLevelID,
      @JsonKey(name: 'ActionName') this.actionName,
      @JsonKey(name: 'SidebarMenu') this.sidebarMenu,
      @JsonKey(name: 'CompanyCode') this.companyCode});

  factory _$AuthLevelIDImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthLevelIDImplFromJson(json);

  @override
  @JsonKey(name: 'AuthLevelID')
  final String? authLevelID;
  @override
  @JsonKey(name: 'ActionName')
  final String? actionName;
  @override
  @JsonKey(name: 'SidebarMenu')
  final String? sidebarMenu;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;

  @override
  String toString() {
    return 'AuthLevelID(authLevelID: $authLevelID, actionName: $actionName, sidebarMenu: $sidebarMenu, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLevelIDImpl &&
            (identical(other.authLevelID, authLevelID) ||
                other.authLevelID == authLevelID) &&
            (identical(other.actionName, actionName) ||
                other.actionName == actionName) &&
            (identical(other.sidebarMenu, sidebarMenu) ||
                other.sidebarMenu == sidebarMenu) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, authLevelID, actionName, sidebarMenu, companyCode);

  /// Create a copy of AuthLevelID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLevelIDImplCopyWith<_$AuthLevelIDImpl> get copyWith =>
      __$$AuthLevelIDImplCopyWithImpl<_$AuthLevelIDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthLevelIDImplToJson(
      this,
    );
  }
}

abstract class _AuthLevelID implements AuthLevelID {
  const factory _AuthLevelID(
          {@JsonKey(name: 'AuthLevelID') final String? authLevelID,
          @JsonKey(name: 'ActionName') final String? actionName,
          @JsonKey(name: 'SidebarMenu') final String? sidebarMenu,
          @JsonKey(name: 'CompanyCode') final String? companyCode}) =
      _$AuthLevelIDImpl;

  factory _AuthLevelID.fromJson(Map<String, dynamic> json) =
      _$AuthLevelIDImpl.fromJson;

  @override
  @JsonKey(name: 'AuthLevelID')
  String? get authLevelID;
  @override
  @JsonKey(name: 'ActionName')
  String? get actionName;
  @override
  @JsonKey(name: 'SidebarMenu')
  String? get sidebarMenu;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;

  /// Create a copy of AuthLevelID
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthLevelIDImplCopyWith<_$AuthLevelIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
