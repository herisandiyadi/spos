// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<LocationData> get data => throw _privateConstructorUsedError;

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({String status, String? message, List<LocationData> data});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationModel
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
              as List<LocationData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<LocationData> data});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$LocationModelImpl(
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
              as List<LocationData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl(
      {required this.status,
      this.message,
      final List<LocationData> data = const []})
      : _data = data;

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<LocationData> _data;
  @override
  @JsonKey()
  List<LocationData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LocationModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {required final String status,
      final String? message,
      final List<LocationData> data}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<LocationData> get data;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
mixin _$LocationData {
  @JsonKey(name: 'LocationID')
  String? get locationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationCode')
  String? get locationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationLabel')
  String? get locationLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this LocationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LocationID') String? locationID,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationLabel') String? locationLabel,
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationID = freezed,
    Object? outletID = freezed,
    Object? locationCode = freezed,
    Object? locationLabel = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLabel: freezed == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
          _$LocationDataImpl value, $Res Function(_$LocationDataImpl) then) =
      __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LocationID') String? locationID,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationLabel') String? locationLabel,
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
      _$LocationDataImpl _value, $Res Function(_$LocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationID = freezed,
    Object? outletID = freezed,
    Object? locationCode = freezed,
    Object? locationLabel = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$LocationDataImpl(
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLabel: freezed == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
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
class _$LocationDataImpl implements _LocationData {
  const _$LocationDataImpl(
      {@JsonKey(name: 'LocationID') this.locationID,
      @JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'LocationCode') this.locationCode,
      @JsonKey(name: 'LocationLabel') this.locationLabel,
      @JsonKey(name: 'is_deleted') this.isDeleted});

  factory _$LocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataImplFromJson(json);

  @override
  @JsonKey(name: 'LocationID')
  final String? locationID;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'LocationCode')
  final String? locationCode;
  @override
  @JsonKey(name: 'LocationLabel')
  final String? locationLabel;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;

  @override
  String toString() {
    return 'LocationData(locationID: $locationID, outletID: $outletID, locationCode: $locationCode, locationLabel: $locationLabel, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationLabel, locationLabel) ||
                other.locationLabel == locationLabel) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locationID, outletID,
      locationCode, locationLabel, isDeleted);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataImplToJson(
      this,
    );
  }
}

abstract class _LocationData implements LocationData {
  const factory _LocationData(
          {@JsonKey(name: 'LocationID') final String? locationID,
          @JsonKey(name: 'OutletID') final String? outletID,
          @JsonKey(name: 'LocationCode') final String? locationCode,
          @JsonKey(name: 'LocationLabel') final String? locationLabel,
          @JsonKey(name: 'is_deleted') final String? isDeleted}) =
      _$LocationDataImpl;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$LocationDataImpl.fromJson;

  @override
  @JsonKey(name: 'LocationID')
  String? get locationID;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'LocationCode')
  String? get locationCode;
  @override
  @JsonKey(name: 'LocationLabel')
  String? get locationLabel;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
