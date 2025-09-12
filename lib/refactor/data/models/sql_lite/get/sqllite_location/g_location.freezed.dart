// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationLiteModel _$LocationLiteModelFromJson(Map<String, dynamic> json) {
  return _LocationLiteModel.fromJson(json);
}

/// @nodoc
mixin _$LocationLiteModel {
  @JsonKey(name: 'locationID')
  int get locationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletID')
  int get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'locationCode')
  String get locationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'locationLabel')
  String get locationLabel => throw _privateConstructorUsedError;

  /// Serializes this LocationLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationLiteModelCopyWith<LocationLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationLiteModelCopyWith<$Res> {
  factory $LocationLiteModelCopyWith(
          LocationLiteModel value, $Res Function(LocationLiteModel) then) =
      _$LocationLiteModelCopyWithImpl<$Res, LocationLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'locationID') int locationID,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'locationCode') String locationCode,
      @JsonKey(name: 'locationLabel') String locationLabel});
}

/// @nodoc
class _$LocationLiteModelCopyWithImpl<$Res, $Val extends LocationLiteModel>
    implements $LocationLiteModelCopyWith<$Res> {
  _$LocationLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationID = null,
    Object? outletID = null,
    Object? locationCode = null,
    Object? locationLabel = null,
  }) {
    return _then(_value.copyWith(
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      locationCode: null == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String,
      locationLabel: null == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationLiteModelImplCopyWith<$Res>
    implements $LocationLiteModelCopyWith<$Res> {
  factory _$$LocationLiteModelImplCopyWith(_$LocationLiteModelImpl value,
          $Res Function(_$LocationLiteModelImpl) then) =
      __$$LocationLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'locationID') int locationID,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'locationCode') String locationCode,
      @JsonKey(name: 'locationLabel') String locationLabel});
}

/// @nodoc
class __$$LocationLiteModelImplCopyWithImpl<$Res>
    extends _$LocationLiteModelCopyWithImpl<$Res, _$LocationLiteModelImpl>
    implements _$$LocationLiteModelImplCopyWith<$Res> {
  __$$LocationLiteModelImplCopyWithImpl(_$LocationLiteModelImpl _value,
      $Res Function(_$LocationLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationID = null,
    Object? outletID = null,
    Object? locationCode = null,
    Object? locationLabel = null,
  }) {
    return _then(_$LocationLiteModelImpl(
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      locationCode: null == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String,
      locationLabel: null == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationLiteModelImpl implements _LocationLiteModel {
  const _$LocationLiteModelImpl(
      {@JsonKey(name: 'locationID') required this.locationID,
      @JsonKey(name: 'outletID') required this.outletID,
      @JsonKey(name: 'locationCode') required this.locationCode,
      @JsonKey(name: 'locationLabel') required this.locationLabel});

  factory _$LocationLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'locationID')
  final int locationID;
  @override
  @JsonKey(name: 'outletID')
  final int outletID;
  @override
  @JsonKey(name: 'locationCode')
  final String locationCode;
  @override
  @JsonKey(name: 'locationLabel')
  final String locationLabel;

  @override
  String toString() {
    return 'LocationLiteModel(locationID: $locationID, outletID: $outletID, locationCode: $locationCode, locationLabel: $locationLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationLiteModelImpl &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationLabel, locationLabel) ||
                other.locationLabel == locationLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, locationID, outletID, locationCode, locationLabel);

  /// Create a copy of LocationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationLiteModelImplCopyWith<_$LocationLiteModelImpl> get copyWith =>
      __$$LocationLiteModelImplCopyWithImpl<_$LocationLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationLiteModelImplToJson(
      this,
    );
  }
}

abstract class _LocationLiteModel implements LocationLiteModel {
  const factory _LocationLiteModel(
      {@JsonKey(name: 'locationID') required final int locationID,
      @JsonKey(name: 'outletID') required final int outletID,
      @JsonKey(name: 'locationCode') required final String locationCode,
      @JsonKey(name: 'locationLabel')
      required final String locationLabel}) = _$LocationLiteModelImpl;

  factory _LocationLiteModel.fromJson(Map<String, dynamic> json) =
      _$LocationLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'locationID')
  int get locationID;
  @override
  @JsonKey(name: 'outletID')
  int get outletID;
  @override
  @JsonKey(name: 'locationCode')
  String get locationCode;
  @override
  @JsonKey(name: 'locationLabel')
  String get locationLabel;

  /// Create a copy of LocationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationLiteModelImplCopyWith<_$LocationLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
