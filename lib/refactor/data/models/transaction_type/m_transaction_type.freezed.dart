// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_transaction_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionTypeModel _$TransactionTypeModelFromJson(Map<String, dynamic> json) {
  return _TransactionTypeModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionTypeModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<TransactionTypeData> get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionTypeModelCopyWith<TransactionTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTypeModelCopyWith<$Res> {
  factory $TransactionTypeModelCopyWith(TransactionTypeModel value,
          $Res Function(TransactionTypeModel) then) =
      _$TransactionTypeModelCopyWithImpl<$Res, TransactionTypeModel>;
  @useResult
  $Res call({String status, String? message, List<TransactionTypeData> data});
}

/// @nodoc
class _$TransactionTypeModelCopyWithImpl<$Res,
        $Val extends TransactionTypeModel>
    implements $TransactionTypeModelCopyWith<$Res> {
  _$TransactionTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionTypeModel
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
              as List<TransactionTypeData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTypeModelImplCopyWith<$Res>
    implements $TransactionTypeModelCopyWith<$Res> {
  factory _$$TransactionTypeModelImplCopyWith(_$TransactionTypeModelImpl value,
          $Res Function(_$TransactionTypeModelImpl) then) =
      __$$TransactionTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<TransactionTypeData> data});
}

/// @nodoc
class __$$TransactionTypeModelImplCopyWithImpl<$Res>
    extends _$TransactionTypeModelCopyWithImpl<$Res, _$TransactionTypeModelImpl>
    implements _$$TransactionTypeModelImplCopyWith<$Res> {
  __$$TransactionTypeModelImplCopyWithImpl(_$TransactionTypeModelImpl _value,
      $Res Function(_$TransactionTypeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$TransactionTypeModelImpl(
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
              as List<TransactionTypeData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTypeModelImpl implements _TransactionTypeModel {
  const _$TransactionTypeModelImpl(
      {required this.status,
      this.message,
      final List<TransactionTypeData> data = const []})
      : _data = data;

  factory _$TransactionTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTypeModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<TransactionTypeData> _data;
  @override
  @JsonKey()
  List<TransactionTypeData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TransactionTypeModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTypeModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TransactionTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTypeModelImplCopyWith<_$TransactionTypeModelImpl>
      get copyWith =>
          __$$TransactionTypeModelImplCopyWithImpl<_$TransactionTypeModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTypeModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionTypeModel implements TransactionTypeModel {
  const factory _TransactionTypeModel(
      {required final String status,
      final String? message,
      final List<TransactionTypeData> data}) = _$TransactionTypeModelImpl;

  factory _TransactionTypeModel.fromJson(Map<String, dynamic> json) =
      _$TransactionTypeModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<TransactionTypeData> get data;

  /// Create a copy of TransactionTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionTypeModelImplCopyWith<_$TransactionTypeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionTypeData _$TransactionTypeDataFromJson(Map<String, dynamic> json) {
  return _TransactionTypeData.fromJson(json);
}

/// @nodoc
mixin _$TransactionTypeData {
  @JsonKey(name: 'TransactionTypeJuncID')
  String? get transactionTypeJuncID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransJuncName')
  String? get transJuncName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransTypeID')
  String? get transTypeID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChargeType')
  String? get chargeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChargeValue')
  String? get chargeValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;

  /// Serializes this TransactionTypeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionTypeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionTypeDataCopyWith<TransactionTypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTypeDataCopyWith<$Res> {
  factory $TransactionTypeDataCopyWith(
          TransactionTypeData value, $Res Function(TransactionTypeData) then) =
      _$TransactionTypeDataCopyWithImpl<$Res, TransactionTypeData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionTypeJuncID') String? transactionTypeJuncID,
      @JsonKey(name: 'TransJuncName') String? transJuncName,
      @JsonKey(name: 'TransTypeID') String? transTypeID,
      @JsonKey(name: 'ChargeType') String? chargeType,
      @JsonKey(name: 'ChargeValue') String? chargeValue,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'TypeName') String? typeName});
}

/// @nodoc
class _$TransactionTypeDataCopyWithImpl<$Res, $Val extends TransactionTypeData>
    implements $TransactionTypeDataCopyWith<$Res> {
  _$TransactionTypeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionTypeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTypeJuncID = freezed,
    Object? transJuncName = freezed,
    Object? transTypeID = freezed,
    Object? chargeType = freezed,
    Object? chargeValue = freezed,
    Object? outletID = freezed,
    Object? typeName = freezed,
  }) {
    return _then(_value.copyWith(
      transactionTypeJuncID: freezed == transactionTypeJuncID
          ? _value.transactionTypeJuncID
          : transactionTypeJuncID // ignore: cast_nullable_to_non_nullable
              as String?,
      transJuncName: freezed == transJuncName
          ? _value.transJuncName
          : transJuncName // ignore: cast_nullable_to_non_nullable
              as String?,
      transTypeID: freezed == transTypeID
          ? _value.transTypeID
          : transTypeID // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeType: freezed == chargeType
          ? _value.chargeType
          : chargeType // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeValue: freezed == chargeValue
          ? _value.chargeValue
          : chargeValue // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTypeDataImplCopyWith<$Res>
    implements $TransactionTypeDataCopyWith<$Res> {
  factory _$$TransactionTypeDataImplCopyWith(_$TransactionTypeDataImpl value,
          $Res Function(_$TransactionTypeDataImpl) then) =
      __$$TransactionTypeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionTypeJuncID') String? transactionTypeJuncID,
      @JsonKey(name: 'TransJuncName') String? transJuncName,
      @JsonKey(name: 'TransTypeID') String? transTypeID,
      @JsonKey(name: 'ChargeType') String? chargeType,
      @JsonKey(name: 'ChargeValue') String? chargeValue,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'TypeName') String? typeName});
}

/// @nodoc
class __$$TransactionTypeDataImplCopyWithImpl<$Res>
    extends _$TransactionTypeDataCopyWithImpl<$Res, _$TransactionTypeDataImpl>
    implements _$$TransactionTypeDataImplCopyWith<$Res> {
  __$$TransactionTypeDataImplCopyWithImpl(_$TransactionTypeDataImpl _value,
      $Res Function(_$TransactionTypeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionTypeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTypeJuncID = freezed,
    Object? transJuncName = freezed,
    Object? transTypeID = freezed,
    Object? chargeType = freezed,
    Object? chargeValue = freezed,
    Object? outletID = freezed,
    Object? typeName = freezed,
  }) {
    return _then(_$TransactionTypeDataImpl(
      transactionTypeJuncID: freezed == transactionTypeJuncID
          ? _value.transactionTypeJuncID
          : transactionTypeJuncID // ignore: cast_nullable_to_non_nullable
              as String?,
      transJuncName: freezed == transJuncName
          ? _value.transJuncName
          : transJuncName // ignore: cast_nullable_to_non_nullable
              as String?,
      transTypeID: freezed == transTypeID
          ? _value.transTypeID
          : transTypeID // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeType: freezed == chargeType
          ? _value.chargeType
          : chargeType // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeValue: freezed == chargeValue
          ? _value.chargeValue
          : chargeValue // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTypeDataImpl implements _TransactionTypeData {
  const _$TransactionTypeDataImpl(
      {@JsonKey(name: 'TransactionTypeJuncID') this.transactionTypeJuncID,
      @JsonKey(name: 'TransJuncName') this.transJuncName,
      @JsonKey(name: 'TransTypeID') this.transTypeID,
      @JsonKey(name: 'ChargeType') this.chargeType,
      @JsonKey(name: 'ChargeValue') this.chargeValue,
      @JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'TypeName') this.typeName});

  factory _$TransactionTypeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTypeDataImplFromJson(json);

  @override
  @JsonKey(name: 'TransactionTypeJuncID')
  final String? transactionTypeJuncID;
  @override
  @JsonKey(name: 'TransJuncName')
  final String? transJuncName;
  @override
  @JsonKey(name: 'TransTypeID')
  final String? transTypeID;
  @override
  @JsonKey(name: 'ChargeType')
  final String? chargeType;
  @override
  @JsonKey(name: 'ChargeValue')
  final String? chargeValue;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;

  @override
  String toString() {
    return 'TransactionTypeData(transactionTypeJuncID: $transactionTypeJuncID, transJuncName: $transJuncName, transTypeID: $transTypeID, chargeType: $chargeType, chargeValue: $chargeValue, outletID: $outletID, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTypeDataImpl &&
            (identical(other.transactionTypeJuncID, transactionTypeJuncID) ||
                other.transactionTypeJuncID == transactionTypeJuncID) &&
            (identical(other.transJuncName, transJuncName) ||
                other.transJuncName == transJuncName) &&
            (identical(other.transTypeID, transTypeID) ||
                other.transTypeID == transTypeID) &&
            (identical(other.chargeType, chargeType) ||
                other.chargeType == chargeType) &&
            (identical(other.chargeValue, chargeValue) ||
                other.chargeValue == chargeValue) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionTypeJuncID,
      transJuncName, transTypeID, chargeType, chargeValue, outletID, typeName);

  /// Create a copy of TransactionTypeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTypeDataImplCopyWith<_$TransactionTypeDataImpl> get copyWith =>
      __$$TransactionTypeDataImplCopyWithImpl<_$TransactionTypeDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTypeDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionTypeData implements TransactionTypeData {
  const factory _TransactionTypeData(
          {@JsonKey(name: 'TransactionTypeJuncID')
          final String? transactionTypeJuncID,
          @JsonKey(name: 'TransJuncName') final String? transJuncName,
          @JsonKey(name: 'TransTypeID') final String? transTypeID,
          @JsonKey(name: 'ChargeType') final String? chargeType,
          @JsonKey(name: 'ChargeValue') final String? chargeValue,
          @JsonKey(name: 'OutletID') final String? outletID,
          @JsonKey(name: 'TypeName') final String? typeName}) =
      _$TransactionTypeDataImpl;

  factory _TransactionTypeData.fromJson(Map<String, dynamic> json) =
      _$TransactionTypeDataImpl.fromJson;

  @override
  @JsonKey(name: 'TransactionTypeJuncID')
  String? get transactionTypeJuncID;
  @override
  @JsonKey(name: 'TransJuncName')
  String? get transJuncName;
  @override
  @JsonKey(name: 'TransTypeID')
  String? get transTypeID;
  @override
  @JsonKey(name: 'ChargeType')
  String? get chargeType;
  @override
  @JsonKey(name: 'ChargeValue')
  String? get chargeValue;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;

  /// Create a copy of TransactionTypeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionTypeDataImplCopyWith<_$TransactionTypeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
