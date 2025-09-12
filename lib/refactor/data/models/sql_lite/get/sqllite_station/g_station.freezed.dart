// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StationLiteModel _$StationLiteModelFromJson(Map<String, dynamic> json) {
  return _StationLiteModel.fromJson(json);
}

/// @nodoc
mixin _$StationLiteModel {
  @JsonKey(name: 'stationID')
  int get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationName')
  String get stationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletID')
  int get outletID => throw _privateConstructorUsedError;

  /// Serializes this StationLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationLiteModelCopyWith<StationLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationLiteModelCopyWith<$Res> {
  factory $StationLiteModelCopyWith(
          StationLiteModel value, $Res Function(StationLiteModel) then) =
      _$StationLiteModelCopyWithImpl<$Res, StationLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stationID') int stationID,
      @JsonKey(name: 'stationName') String stationName,
      @JsonKey(name: 'outletID') int outletID});
}

/// @nodoc
class _$StationLiteModelCopyWithImpl<$Res, $Val extends StationLiteModel>
    implements $StationLiteModelCopyWith<$Res> {
  _$StationLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationID = null,
    Object? stationName = null,
    Object? outletID = null,
  }) {
    return _then(_value.copyWith(
      stationID: null == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int,
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationLiteModelImplCopyWith<$Res>
    implements $StationLiteModelCopyWith<$Res> {
  factory _$$StationLiteModelImplCopyWith(_$StationLiteModelImpl value,
          $Res Function(_$StationLiteModelImpl) then) =
      __$$StationLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stationID') int stationID,
      @JsonKey(name: 'stationName') String stationName,
      @JsonKey(name: 'outletID') int outletID});
}

/// @nodoc
class __$$StationLiteModelImplCopyWithImpl<$Res>
    extends _$StationLiteModelCopyWithImpl<$Res, _$StationLiteModelImpl>
    implements _$$StationLiteModelImplCopyWith<$Res> {
  __$$StationLiteModelImplCopyWithImpl(_$StationLiteModelImpl _value,
      $Res Function(_$StationLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationID = null,
    Object? stationName = null,
    Object? outletID = null,
  }) {
    return _then(_$StationLiteModelImpl(
      stationID: null == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int,
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationLiteModelImpl implements _StationLiteModel {
  const _$StationLiteModelImpl(
      {@JsonKey(name: 'stationID') required this.stationID,
      @JsonKey(name: 'stationName') required this.stationName,
      @JsonKey(name: 'outletID') required this.outletID});

  factory _$StationLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'stationID')
  final int stationID;
  @override
  @JsonKey(name: 'stationName')
  final String stationName;
  @override
  @JsonKey(name: 'outletID')
  final int outletID;

  @override
  String toString() {
    return 'StationLiteModel(stationID: $stationID, stationName: $stationName, outletID: $outletID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationLiteModelImpl &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stationID, stationName, outletID);

  /// Create a copy of StationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationLiteModelImplCopyWith<_$StationLiteModelImpl> get copyWith =>
      __$$StationLiteModelImplCopyWithImpl<_$StationLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationLiteModelImplToJson(
      this,
    );
  }
}

abstract class _StationLiteModel implements StationLiteModel {
  const factory _StationLiteModel(
          {@JsonKey(name: 'stationID') required final int stationID,
          @JsonKey(name: 'stationName') required final String stationName,
          @JsonKey(name: 'outletID') required final int outletID}) =
      _$StationLiteModelImpl;

  factory _StationLiteModel.fromJson(Map<String, dynamic> json) =
      _$StationLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'stationID')
  int get stationID;
  @override
  @JsonKey(name: 'stationName')
  String get stationName;
  @override
  @JsonKey(name: 'outletID')
  int get outletID;

  /// Create a copy of StationLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationLiteModelImplCopyWith<_$StationLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
