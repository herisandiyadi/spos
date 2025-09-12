// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CityData> get data => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call({String status, String? message, List<CityData> data});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
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
              as List<CityData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<CityData> data});
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
      _$CityModelImpl _value, $Res Function(_$CityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$CityModelImpl(
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
              as List<CityData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements _CityModel {
  const _$CityModelImpl(
      {required this.status,
      this.message,
      final List<CityData> data = const []})
      : _data = data;

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<CityData> _data;
  @override
  @JsonKey()
  List<CityData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CityModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(
      this,
    );
  }
}

abstract class _CityModel implements CityModel {
  const factory _CityModel(
      {required final String status,
      final String? message,
      final List<CityData> data}) = _$CityModelImpl;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<CityData> get data;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CityData _$CityDataFromJson(Map<String, dynamic> json) {
  return _CityData.fromJson(json);
}

/// @nodoc
mixin _$CityData {
  @JsonKey(name: 'ArrID')
  String? get arrId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CityID')
  String? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceID')
  String? get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CityName')
  String? get cityName => throw _privateConstructorUsedError;

  /// Serializes this CityData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityDataCopyWith<CityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDataCopyWith<$Res> {
  factory $CityDataCopyWith(CityData value, $Res Function(CityData) then) =
      _$CityDataCopyWithImpl<$Res, CityData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ArrID') String? arrId,
      @JsonKey(name: 'CityID') String? cityId,
      @JsonKey(name: 'ProvinceID') String? provinceId,
      @JsonKey(name: 'CityName') String? cityName});
}

/// @nodoc
class _$CityDataCopyWithImpl<$Res, $Val extends CityData>
    implements $CityDataCopyWith<$Res> {
  _$CityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrId = freezed,
    Object? cityId = freezed,
    Object? provinceId = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      arrId: freezed == arrId
          ? _value.arrId
          : arrId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityDataImplCopyWith<$Res>
    implements $CityDataCopyWith<$Res> {
  factory _$$CityDataImplCopyWith(
          _$CityDataImpl value, $Res Function(_$CityDataImpl) then) =
      __$$CityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ArrID') String? arrId,
      @JsonKey(name: 'CityID') String? cityId,
      @JsonKey(name: 'ProvinceID') String? provinceId,
      @JsonKey(name: 'CityName') String? cityName});
}

/// @nodoc
class __$$CityDataImplCopyWithImpl<$Res>
    extends _$CityDataCopyWithImpl<$Res, _$CityDataImpl>
    implements _$$CityDataImplCopyWith<$Res> {
  __$$CityDataImplCopyWithImpl(
      _$CityDataImpl _value, $Res Function(_$CityDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrId = freezed,
    Object? cityId = freezed,
    Object? provinceId = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_$CityDataImpl(
      arrId: freezed == arrId
          ? _value.arrId
          : arrId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityDataImpl implements _CityData {
  const _$CityDataImpl(
      {@JsonKey(name: 'ArrID') this.arrId,
      @JsonKey(name: 'CityID') this.cityId,
      @JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'CityName') this.cityName});

  factory _$CityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityDataImplFromJson(json);

  @override
  @JsonKey(name: 'ArrID')
  final String? arrId;
  @override
  @JsonKey(name: 'CityID')
  final String? cityId;
  @override
  @JsonKey(name: 'ProvinceID')
  final String? provinceId;
  @override
  @JsonKey(name: 'CityName')
  final String? cityName;

  @override
  String toString() {
    return 'CityData(arrId: $arrId, cityId: $cityId, provinceId: $provinceId, cityName: $cityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityDataImpl &&
            (identical(other.arrId, arrId) || other.arrId == arrId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, arrId, cityId, provinceId, cityName);

  /// Create a copy of CityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityDataImplCopyWith<_$CityDataImpl> get copyWith =>
      __$$CityDataImplCopyWithImpl<_$CityDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityDataImplToJson(
      this,
    );
  }
}

abstract class _CityData implements CityData {
  const factory _CityData(
      {@JsonKey(name: 'ArrID') final String? arrId,
      @JsonKey(name: 'CityID') final String? cityId,
      @JsonKey(name: 'ProvinceID') final String? provinceId,
      @JsonKey(name: 'CityName') final String? cityName}) = _$CityDataImpl;

  factory _CityData.fromJson(Map<String, dynamic> json) =
      _$CityDataImpl.fromJson;

  @override
  @JsonKey(name: 'ArrID')
  String? get arrId;
  @override
  @JsonKey(name: 'CityID')
  String? get cityId;
  @override
  @JsonKey(name: 'ProvinceID')
  String? get provinceId;
  @override
  @JsonKey(name: 'CityName')
  String? get cityName;

  /// Create a copy of CityData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityDataImplCopyWith<_$CityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
