// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StationModel _$StationModelFromJson(Map<String, dynamic> json) {
  return _StationModel.fromJson(json);
}

/// @nodoc
mixin _$StationModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<StationData> get data => throw _privateConstructorUsedError;

  /// Serializes this StationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationModelCopyWith<StationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationModelCopyWith<$Res> {
  factory $StationModelCopyWith(
          StationModel value, $Res Function(StationModel) then) =
      _$StationModelCopyWithImpl<$Res, StationModel>;
  @useResult
  $Res call({String status, String? message, List<StationData> data});
}

/// @nodoc
class _$StationModelCopyWithImpl<$Res, $Val extends StationModel>
    implements $StationModelCopyWith<$Res> {
  _$StationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationModel
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
              as List<StationData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationModelImplCopyWith<$Res>
    implements $StationModelCopyWith<$Res> {
  factory _$$StationModelImplCopyWith(
          _$StationModelImpl value, $Res Function(_$StationModelImpl) then) =
      __$$StationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<StationData> data});
}

/// @nodoc
class __$$StationModelImplCopyWithImpl<$Res>
    extends _$StationModelCopyWithImpl<$Res, _$StationModelImpl>
    implements _$$StationModelImplCopyWith<$Res> {
  __$$StationModelImplCopyWithImpl(
      _$StationModelImpl _value, $Res Function(_$StationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$StationModelImpl(
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
              as List<StationData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationModelImpl implements _StationModel {
  const _$StationModelImpl(
      {required this.status,
      this.message,
      final List<StationData> data = const []})
      : _data = data;

  factory _$StationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<StationData> _data;
  @override
  @JsonKey()
  List<StationData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StationModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationModelImplCopyWith<_$StationModelImpl> get copyWith =>
      __$$StationModelImplCopyWithImpl<_$StationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationModelImplToJson(
      this,
    );
  }
}

abstract class _StationModel implements StationModel {
  const factory _StationModel(
      {required final String status,
      final String? message,
      final List<StationData> data}) = _$StationModelImpl;

  factory _StationModel.fromJson(Map<String, dynamic> json) =
      _$StationModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<StationData> get data;

  /// Create a copy of StationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationModelImplCopyWith<_$StationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StationData _$StationDataFromJson(Map<String, dynamic> json) {
  return _StationData.fromJson(json);
}

/// @nodoc
mixin _$StationData {
  @JsonKey(name: 'StationID')
  String? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationName')
  String? get stationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;

  /// Serializes this StationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationDataCopyWith<StationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationDataCopyWith<$Res> {
  factory $StationDataCopyWith(
          StationData value, $Res Function(StationData) then) =
      _$StationDataCopyWithImpl<$Res, StationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StationID') String? stationID,
      @JsonKey(name: 'StationName') String? stationName,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class _$StationDataCopyWithImpl<$Res, $Val extends StationData>
    implements $StationDataCopyWith<$Res> {
  _$StationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationID = freezed,
    Object? stationName = freezed,
    Object? outletID = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_value.copyWith(
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationDataImplCopyWith<$Res>
    implements $StationDataCopyWith<$Res> {
  factory _$$StationDataImplCopyWith(
          _$StationDataImpl value, $Res Function(_$StationDataImpl) then) =
      __$$StationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StationID') String? stationID,
      @JsonKey(name: 'StationName') String? stationName,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class __$$StationDataImplCopyWithImpl<$Res>
    extends _$StationDataCopyWithImpl<$Res, _$StationDataImpl>
    implements _$$StationDataImplCopyWith<$Res> {
  __$$StationDataImplCopyWithImpl(
      _$StationDataImpl _value, $Res Function(_$StationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationID = freezed,
    Object? stationName = freezed,
    Object? outletID = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_$StationDataImpl(
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
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
class _$StationDataImpl implements _StationData {
  const _$StationDataImpl(
      {@JsonKey(name: 'StationID') this.stationID,
      @JsonKey(name: 'StationName') this.stationName,
      @JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'CompanyCode') this.companyCode});

  factory _$StationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationDataImplFromJson(json);

  @override
  @JsonKey(name: 'StationID')
  final String? stationID;
  @override
  @JsonKey(name: 'StationName')
  final String? stationName;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;

  @override
  String toString() {
    return 'StationData(stationID: $stationID, stationName: $stationName, outletID: $outletID, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationDataImpl &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stationID, stationName, outletID, companyCode);

  /// Create a copy of StationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationDataImplCopyWith<_$StationDataImpl> get copyWith =>
      __$$StationDataImplCopyWithImpl<_$StationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationDataImplToJson(
      this,
    );
  }
}

abstract class _StationData implements StationData {
  const factory _StationData(
          {@JsonKey(name: 'StationID') final String? stationID,
          @JsonKey(name: 'StationName') final String? stationName,
          @JsonKey(name: 'OutletID') final String? outletID,
          @JsonKey(name: 'CompanyCode') final String? companyCode}) =
      _$StationDataImpl;

  factory _StationData.fromJson(Map<String, dynamic> json) =
      _$StationDataImpl.fromJson;

  @override
  @JsonKey(name: 'StationID')
  String? get stationID;
  @override
  @JsonKey(name: 'StationName')
  String? get stationName;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;

  /// Create a copy of StationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationDataImplCopyWith<_$StationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
