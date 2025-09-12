// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_activity_pos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActPOSLiteModel _$ActPOSLiteModelFromJson(Map<String, dynamic> json) {
  return _ActPOSLiteModel.fromJson(json);
}

/// @nodoc
mixin _$ActPOSLiteModel {
  @JsonKey(name: 'logID')
  int get logID => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  int get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityType')
  String get activityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'reffID')
  String get reffID => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityDesc')
  String get activityDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'ipAddress')
  String get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceName')
  String get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyCode')
  String get companyCode => throw _privateConstructorUsedError;

  /// Serializes this ActPOSLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActPOSLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActPOSLiteModelCopyWith<ActPOSLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActPOSLiteModelCopyWith<$Res> {
  factory $ActPOSLiteModelCopyWith(
          ActPOSLiteModel value, $Res Function(ActPOSLiteModel) then) =
      _$ActPOSLiteModelCopyWithImpl<$Res, ActPOSLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'logID') int logID,
      @JsonKey(name: 'userID') int userID,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'activityType') String activityType,
      @JsonKey(name: 'reffID') String reffID,
      @JsonKey(name: 'activityDesc') String activityDesc,
      @JsonKey(name: 'ipAddress') String ipAddress,
      @JsonKey(name: 'deviceName') String deviceName,
      @JsonKey(name: 'companyCode') String companyCode});
}

/// @nodoc
class _$ActPOSLiteModelCopyWithImpl<$Res, $Val extends ActPOSLiteModel>
    implements $ActPOSLiteModelCopyWith<$Res> {
  _$ActPOSLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActPOSLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logID = null,
    Object? userID = null,
    Object? datetime = null,
    Object? activityType = null,
    Object? reffID = null,
    Object? activityDesc = null,
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? companyCode = null,
  }) {
    return _then(_value.copyWith(
      logID: null == logID
          ? _value.logID
          : logID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
      reffID: null == reffID
          ? _value.reffID
          : reffID // ignore: cast_nullable_to_non_nullable
              as String,
      activityDesc: null == activityDesc
          ? _value.activityDesc
          : activityDesc // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActPOSLiteModelImplCopyWith<$Res>
    implements $ActPOSLiteModelCopyWith<$Res> {
  factory _$$ActPOSLiteModelImplCopyWith(_$ActPOSLiteModelImpl value,
          $Res Function(_$ActPOSLiteModelImpl) then) =
      __$$ActPOSLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'logID') int logID,
      @JsonKey(name: 'userID') int userID,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'activityType') String activityType,
      @JsonKey(name: 'reffID') String reffID,
      @JsonKey(name: 'activityDesc') String activityDesc,
      @JsonKey(name: 'ipAddress') String ipAddress,
      @JsonKey(name: 'deviceName') String deviceName,
      @JsonKey(name: 'companyCode') String companyCode});
}

/// @nodoc
class __$$ActPOSLiteModelImplCopyWithImpl<$Res>
    extends _$ActPOSLiteModelCopyWithImpl<$Res, _$ActPOSLiteModelImpl>
    implements _$$ActPOSLiteModelImplCopyWith<$Res> {
  __$$ActPOSLiteModelImplCopyWithImpl(
      _$ActPOSLiteModelImpl _value, $Res Function(_$ActPOSLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActPOSLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logID = null,
    Object? userID = null,
    Object? datetime = null,
    Object? activityType = null,
    Object? reffID = null,
    Object? activityDesc = null,
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? companyCode = null,
  }) {
    return _then(_$ActPOSLiteModelImpl(
      logID: null == logID
          ? _value.logID
          : logID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
      reffID: null == reffID
          ? _value.reffID
          : reffID // ignore: cast_nullable_to_non_nullable
              as String,
      activityDesc: null == activityDesc
          ? _value.activityDesc
          : activityDesc // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActPOSLiteModelImpl implements _ActPOSLiteModel {
  const _$ActPOSLiteModelImpl(
      {@JsonKey(name: 'logID') required this.logID,
      @JsonKey(name: 'userID') required this.userID,
      @JsonKey(name: 'datetime') required this.datetime,
      @JsonKey(name: 'activityType') required this.activityType,
      @JsonKey(name: 'reffID') required this.reffID,
      @JsonKey(name: 'activityDesc') required this.activityDesc,
      @JsonKey(name: 'ipAddress') required this.ipAddress,
      @JsonKey(name: 'deviceName') required this.deviceName,
      @JsonKey(name: 'companyCode') required this.companyCode});

  factory _$ActPOSLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActPOSLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'logID')
  final int logID;
  @override
  @JsonKey(name: 'userID')
  final int userID;
  @override
  @JsonKey(name: 'datetime')
  final String datetime;
  @override
  @JsonKey(name: 'activityType')
  final String activityType;
  @override
  @JsonKey(name: 'reffID')
  final String reffID;
  @override
  @JsonKey(name: 'activityDesc')
  final String activityDesc;
  @override
  @JsonKey(name: 'ipAddress')
  final String ipAddress;
  @override
  @JsonKey(name: 'deviceName')
  final String deviceName;
  @override
  @JsonKey(name: 'companyCode')
  final String companyCode;

  @override
  String toString() {
    return 'ActPOSLiteModel(logID: $logID, userID: $userID, datetime: $datetime, activityType: $activityType, reffID: $reffID, activityDesc: $activityDesc, ipAddress: $ipAddress, deviceName: $deviceName, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActPOSLiteModelImpl &&
            (identical(other.logID, logID) || other.logID == logID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.reffID, reffID) || other.reffID == reffID) &&
            (identical(other.activityDesc, activityDesc) ||
                other.activityDesc == activityDesc) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, logID, userID, datetime,
      activityType, reffID, activityDesc, ipAddress, deviceName, companyCode);

  /// Create a copy of ActPOSLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActPOSLiteModelImplCopyWith<_$ActPOSLiteModelImpl> get copyWith =>
      __$$ActPOSLiteModelImplCopyWithImpl<_$ActPOSLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActPOSLiteModelImplToJson(
      this,
    );
  }
}

abstract class _ActPOSLiteModel implements ActPOSLiteModel {
  const factory _ActPOSLiteModel(
          {@JsonKey(name: 'logID') required final int logID,
          @JsonKey(name: 'userID') required final int userID,
          @JsonKey(name: 'datetime') required final String datetime,
          @JsonKey(name: 'activityType') required final String activityType,
          @JsonKey(name: 'reffID') required final String reffID,
          @JsonKey(name: 'activityDesc') required final String activityDesc,
          @JsonKey(name: 'ipAddress') required final String ipAddress,
          @JsonKey(name: 'deviceName') required final String deviceName,
          @JsonKey(name: 'companyCode') required final String companyCode}) =
      _$ActPOSLiteModelImpl;

  factory _ActPOSLiteModel.fromJson(Map<String, dynamic> json) =
      _$ActPOSLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'logID')
  int get logID;
  @override
  @JsonKey(name: 'userID')
  int get userID;
  @override
  @JsonKey(name: 'datetime')
  String get datetime;
  @override
  @JsonKey(name: 'activityType')
  String get activityType;
  @override
  @JsonKey(name: 'reffID')
  String get reffID;
  @override
  @JsonKey(name: 'activityDesc')
  String get activityDesc;
  @override
  @JsonKey(name: 'ipAddress')
  String get ipAddress;
  @override
  @JsonKey(name: 'deviceName')
  String get deviceName;
  @override
  @JsonKey(name: 'companyCode')
  String get companyCode;

  /// Create a copy of ActPOSLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActPOSLiteModelImplCopyWith<_$ActPOSLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
