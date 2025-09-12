// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityLiteModel _$CityLiteModelFromJson(Map<String, dynamic> json) {
  return _CityLiteModel.fromJson(json);
}

/// @nodoc
mixin _$CityLiteModel {
  @JsonKey(name: 'cityID')
  int get cityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'provinceID')
  int get provinceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'cityName')
  String get cityName => throw _privateConstructorUsedError;

  /// Serializes this CityLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityLiteModelCopyWith<CityLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityLiteModelCopyWith<$Res> {
  factory $CityLiteModelCopyWith(
          CityLiteModel value, $Res Function(CityLiteModel) then) =
      _$CityLiteModelCopyWithImpl<$Res, CityLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cityID') int cityID,
      @JsonKey(name: 'provinceID') int provinceID,
      @JsonKey(name: 'cityName') String cityName});
}

/// @nodoc
class _$CityLiteModelCopyWithImpl<$Res, $Val extends CityLiteModel>
    implements $CityLiteModelCopyWith<$Res> {
  _$CityLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityID = null,
    Object? provinceID = null,
    Object? cityName = null,
  }) {
    return _then(_value.copyWith(
      cityID: null == cityID
          ? _value.cityID
          : cityID // ignore: cast_nullable_to_non_nullable
              as int,
      provinceID: null == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityLiteModelImplCopyWith<$Res>
    implements $CityLiteModelCopyWith<$Res> {
  factory _$$CityLiteModelImplCopyWith(
          _$CityLiteModelImpl value, $Res Function(_$CityLiteModelImpl) then) =
      __$$CityLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cityID') int cityID,
      @JsonKey(name: 'provinceID') int provinceID,
      @JsonKey(name: 'cityName') String cityName});
}

/// @nodoc
class __$$CityLiteModelImplCopyWithImpl<$Res>
    extends _$CityLiteModelCopyWithImpl<$Res, _$CityLiteModelImpl>
    implements _$$CityLiteModelImplCopyWith<$Res> {
  __$$CityLiteModelImplCopyWithImpl(
      _$CityLiteModelImpl _value, $Res Function(_$CityLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityID = null,
    Object? provinceID = null,
    Object? cityName = null,
  }) {
    return _then(_$CityLiteModelImpl(
      cityID: null == cityID
          ? _value.cityID
          : cityID // ignore: cast_nullable_to_non_nullable
              as int,
      provinceID: null == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityLiteModelImpl implements _CityLiteModel {
  const _$CityLiteModelImpl(
      {@JsonKey(name: 'cityID') required this.cityID,
      @JsonKey(name: 'provinceID') required this.provinceID,
      @JsonKey(name: 'cityName') required this.cityName});

  factory _$CityLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'cityID')
  final int cityID;
  @override
  @JsonKey(name: 'provinceID')
  final int provinceID;
  @override
  @JsonKey(name: 'cityName')
  final String cityName;

  @override
  String toString() {
    return 'CityLiteModel(cityID: $cityID, provinceID: $provinceID, cityName: $cityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityLiteModelImpl &&
            (identical(other.cityID, cityID) || other.cityID == cityID) &&
            (identical(other.provinceID, provinceID) ||
                other.provinceID == provinceID) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cityID, provinceID, cityName);

  /// Create a copy of CityLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityLiteModelImplCopyWith<_$CityLiteModelImpl> get copyWith =>
      __$$CityLiteModelImplCopyWithImpl<_$CityLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityLiteModelImplToJson(
      this,
    );
  }
}

abstract class _CityLiteModel implements CityLiteModel {
  const factory _CityLiteModel(
          {@JsonKey(name: 'cityID') required final int cityID,
          @JsonKey(name: 'provinceID') required final int provinceID,
          @JsonKey(name: 'cityName') required final String cityName}) =
      _$CityLiteModelImpl;

  factory _CityLiteModel.fromJson(Map<String, dynamic> json) =
      _$CityLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'cityID')
  int get cityID;
  @override
  @JsonKey(name: 'provinceID')
  int get provinceID;
  @override
  @JsonKey(name: 'cityName')
  String get cityName;

  /// Create a copy of CityLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityLiteModelImplCopyWith<_$CityLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
