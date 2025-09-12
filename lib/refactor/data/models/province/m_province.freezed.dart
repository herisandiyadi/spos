// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_province.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) {
  return _ProvinceModel.fromJson(json);
}

/// @nodoc
mixin _$ProvinceModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ProvinceData> get data => throw _privateConstructorUsedError;

  /// Serializes this ProvinceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceModelCopyWith<ProvinceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceModelCopyWith<$Res> {
  factory $ProvinceModelCopyWith(
          ProvinceModel value, $Res Function(ProvinceModel) then) =
      _$ProvinceModelCopyWithImpl<$Res, ProvinceModel>;
  @useResult
  $Res call({String status, String? message, List<ProvinceData> data});
}

/// @nodoc
class _$ProvinceModelCopyWithImpl<$Res, $Val extends ProvinceModel>
    implements $ProvinceModelCopyWith<$Res> {
  _$ProvinceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceModel
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
              as List<ProvinceData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceModelImplCopyWith<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  factory _$$ProvinceModelImplCopyWith(
          _$ProvinceModelImpl value, $Res Function(_$ProvinceModelImpl) then) =
      __$$ProvinceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<ProvinceData> data});
}

/// @nodoc
class __$$ProvinceModelImplCopyWithImpl<$Res>
    extends _$ProvinceModelCopyWithImpl<$Res, _$ProvinceModelImpl>
    implements _$$ProvinceModelImplCopyWith<$Res> {
  __$$ProvinceModelImplCopyWithImpl(
      _$ProvinceModelImpl _value, $Res Function(_$ProvinceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$ProvinceModelImpl(
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
              as List<ProvinceData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceModelImpl implements _ProvinceModel {
  const _$ProvinceModelImpl(
      {required this.status,
      this.message,
      final List<ProvinceData> data = const []})
      : _data = data;

  factory _$ProvinceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<ProvinceData> _data;
  @override
  @JsonKey()
  List<ProvinceData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ProvinceModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      __$$ProvinceModelImplCopyWithImpl<_$ProvinceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceModelImplToJson(
      this,
    );
  }
}

abstract class _ProvinceModel implements ProvinceModel {
  const factory _ProvinceModel(
      {required final String status,
      final String? message,
      final List<ProvinceData> data}) = _$ProvinceModelImpl;

  factory _ProvinceModel.fromJson(Map<String, dynamic> json) =
      _$ProvinceModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<ProvinceData> get data;

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProvinceData _$ProvinceDataFromJson(Map<String, dynamic> json) {
  return _ProvinceData.fromJson(json);
}

/// @nodoc
mixin _$ProvinceData {
  @JsonKey(name: 'ProvinceID')
  String? get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceName')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timezone')
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value')
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this ProvinceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceDataCopyWith<ProvinceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceDataCopyWith<$Res> {
  factory $ProvinceDataCopyWith(
          ProvinceData value, $Res Function(ProvinceData) then) =
      _$ProvinceDataCopyWithImpl<$Res, ProvinceData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProvinceID') String? provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'Timezone') String? timezone,
      @JsonKey(name: 'Value') String? value});
}

/// @nodoc
class _$ProvinceDataCopyWithImpl<$Res, $Val extends ProvinceData>
    implements $ProvinceDataCopyWith<$Res> {
  _$ProvinceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? timezone = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceDataImplCopyWith<$Res>
    implements $ProvinceDataCopyWith<$Res> {
  factory _$$ProvinceDataImplCopyWith(
          _$ProvinceDataImpl value, $Res Function(_$ProvinceDataImpl) then) =
      __$$ProvinceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProvinceID') String? provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'Timezone') String? timezone,
      @JsonKey(name: 'Value') String? value});
}

/// @nodoc
class __$$ProvinceDataImplCopyWithImpl<$Res>
    extends _$ProvinceDataCopyWithImpl<$Res, _$ProvinceDataImpl>
    implements _$$ProvinceDataImplCopyWith<$Res> {
  __$$ProvinceDataImplCopyWithImpl(
      _$ProvinceDataImpl _value, $Res Function(_$ProvinceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvinceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? timezone = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ProvinceDataImpl(
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceDataImpl implements _ProvinceData {
  const _$ProvinceDataImpl(
      {@JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'ProvinceName') this.provinceName,
      @JsonKey(name: 'Timezone') this.timezone,
      @JsonKey(name: 'Value') this.value});

  factory _$ProvinceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceDataImplFromJson(json);

  @override
  @JsonKey(name: 'ProvinceID')
  final String? provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  final String? provinceName;
  @override
  @JsonKey(name: 'Timezone')
  final String? timezone;
  @override
  @JsonKey(name: 'Value')
  final String? value;

  @override
  String toString() {
    return 'ProvinceData(provinceId: $provinceId, provinceName: $provinceName, timezone: $timezone, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceDataImpl &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provinceId, provinceName, timezone, value);

  /// Create a copy of ProvinceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceDataImplCopyWith<_$ProvinceDataImpl> get copyWith =>
      __$$ProvinceDataImplCopyWithImpl<_$ProvinceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceDataImplToJson(
      this,
    );
  }
}

abstract class _ProvinceData implements ProvinceData {
  const factory _ProvinceData(
      {@JsonKey(name: 'ProvinceID') final String? provinceId,
      @JsonKey(name: 'ProvinceName') final String? provinceName,
      @JsonKey(name: 'Timezone') final String? timezone,
      @JsonKey(name: 'Value') final String? value}) = _$ProvinceDataImpl;

  factory _ProvinceData.fromJson(Map<String, dynamic> json) =
      _$ProvinceDataImpl.fromJson;

  @override
  @JsonKey(name: 'ProvinceID')
  String? get provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  String? get provinceName;
  @override
  @JsonKey(name: 'Timezone')
  String? get timezone;
  @override
  @JsonKey(name: 'Value')
  String? get value;

  /// Create a copy of ProvinceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceDataImplCopyWith<_$ProvinceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
