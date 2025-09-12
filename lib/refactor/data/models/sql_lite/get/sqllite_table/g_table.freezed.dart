// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableLiteModel _$TableLiteModelFromJson(Map<String, dynamic> json) {
  return _TableLiteModel.fromJson(json);
}

/// @nodoc
mixin _$TableLiteModel {
  @JsonKey(name: 'tableID')
  int get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'locationID')
  int get locationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableNumber')
  int get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableLabel')
  String get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletID')
  int get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableStatus')
  String get tableStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String? get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusTransaction')
  String? get statusTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniqueNumberSM')
  int? get uniqueNumberSM => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateTimeSM')
  String? get dateTimeSM => throw _privateConstructorUsedError;

  /// Serializes this TableLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableLiteModelCopyWith<TableLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableLiteModelCopyWith<$Res> {
  factory $TableLiteModelCopyWith(
          TableLiteModel value, $Res Function(TableLiteModel) then) =
      _$TableLiteModelCopyWithImpl<$Res, TableLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'locationID') int locationID,
      @JsonKey(name: 'tableNumber') int tableNumber,
      @JsonKey(name: 'tableLabel') String tableLabel,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'tableStatus') String tableStatus,
      @JsonKey(name: 'datetime') String? dateTime,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'statusTransaction') String? statusTransaction,
      @JsonKey(name: 'uniqueNumberSM') int? uniqueNumberSM,
      @JsonKey(name: 'dateTimeSM') String? dateTimeSM});
}

/// @nodoc
class _$TableLiteModelCopyWithImpl<$Res, $Val extends TableLiteModel>
    implements $TableLiteModelCopyWith<$Res> {
  _$TableLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableID = null,
    Object? locationID = null,
    Object? tableNumber = null,
    Object? tableLabel = null,
    Object? outletID = null,
    Object? tableStatus = null,
    Object? dateTime = freezed,
    Object? transactionNumber = freezed,
    Object? statusTransaction = freezed,
    Object? uniqueNumberSM = freezed,
    Object? dateTimeSM = freezed,
  }) {
    return _then(_value.copyWith(
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: null == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      tableStatus: null == tableStatus
          ? _value.tableStatus
          : tableStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueNumberSM: freezed == uniqueNumberSM
          ? _value.uniqueNumberSM
          : uniqueNumberSM // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeSM: freezed == dateTimeSM
          ? _value.dateTimeSM
          : dateTimeSM // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableLiteModelImplCopyWith<$Res>
    implements $TableLiteModelCopyWith<$Res> {
  factory _$$TableLiteModelImplCopyWith(_$TableLiteModelImpl value,
          $Res Function(_$TableLiteModelImpl) then) =
      __$$TableLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'locationID') int locationID,
      @JsonKey(name: 'tableNumber') int tableNumber,
      @JsonKey(name: 'tableLabel') String tableLabel,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'tableStatus') String tableStatus,
      @JsonKey(name: 'datetime') String? dateTime,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'statusTransaction') String? statusTransaction,
      @JsonKey(name: 'uniqueNumberSM') int? uniqueNumberSM,
      @JsonKey(name: 'dateTimeSM') String? dateTimeSM});
}

/// @nodoc
class __$$TableLiteModelImplCopyWithImpl<$Res>
    extends _$TableLiteModelCopyWithImpl<$Res, _$TableLiteModelImpl>
    implements _$$TableLiteModelImplCopyWith<$Res> {
  __$$TableLiteModelImplCopyWithImpl(
      _$TableLiteModelImpl _value, $Res Function(_$TableLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableID = null,
    Object? locationID = null,
    Object? tableNumber = null,
    Object? tableLabel = null,
    Object? outletID = null,
    Object? tableStatus = null,
    Object? dateTime = freezed,
    Object? transactionNumber = freezed,
    Object? statusTransaction = freezed,
    Object? uniqueNumberSM = freezed,
    Object? dateTimeSM = freezed,
  }) {
    return _then(_$TableLiteModelImpl(
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: null == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      tableStatus: null == tableStatus
          ? _value.tableStatus
          : tableStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueNumberSM: freezed == uniqueNumberSM
          ? _value.uniqueNumberSM
          : uniqueNumberSM // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTimeSM: freezed == dateTimeSM
          ? _value.dateTimeSM
          : dateTimeSM // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableLiteModelImpl implements _TableLiteModel {
  const _$TableLiteModelImpl(
      {@JsonKey(name: 'tableID') required this.tableID,
      @JsonKey(name: 'locationID') required this.locationID,
      @JsonKey(name: 'tableNumber') required this.tableNumber,
      @JsonKey(name: 'tableLabel') required this.tableLabel,
      @JsonKey(name: 'outletID') required this.outletID,
      @JsonKey(name: 'tableStatus') required this.tableStatus,
      @JsonKey(name: 'datetime') this.dateTime,
      @JsonKey(name: 'transactionNumber') this.transactionNumber,
      @JsonKey(name: 'statusTransaction') this.statusTransaction,
      @JsonKey(name: 'uniqueNumberSM') this.uniqueNumberSM,
      @JsonKey(name: 'dateTimeSM') this.dateTimeSM});

  factory _$TableLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'tableID')
  final int tableID;
  @override
  @JsonKey(name: 'locationID')
  final int locationID;
  @override
  @JsonKey(name: 'tableNumber')
  final int tableNumber;
  @override
  @JsonKey(name: 'tableLabel')
  final String tableLabel;
  @override
  @JsonKey(name: 'outletID')
  final int outletID;
  @override
  @JsonKey(name: 'tableStatus')
  final String tableStatus;
  @override
  @JsonKey(name: 'datetime')
  final String? dateTime;
  @override
  @JsonKey(name: 'transactionNumber')
  final String? transactionNumber;
  @override
  @JsonKey(name: 'statusTransaction')
  final String? statusTransaction;
  @override
  @JsonKey(name: 'uniqueNumberSM')
  final int? uniqueNumberSM;
  @override
  @JsonKey(name: 'dateTimeSM')
  final String? dateTimeSM;

  @override
  String toString() {
    return 'TableLiteModel(tableID: $tableID, locationID: $locationID, tableNumber: $tableNumber, tableLabel: $tableLabel, outletID: $outletID, tableStatus: $tableStatus, dateTime: $dateTime, transactionNumber: $transactionNumber, statusTransaction: $statusTransaction, uniqueNumberSM: $uniqueNumberSM, dateTimeSM: $dateTimeSM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableLiteModelImpl &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.tableStatus, tableStatus) ||
                other.tableStatus == tableStatus) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.statusTransaction, statusTransaction) ||
                other.statusTransaction == statusTransaction) &&
            (identical(other.uniqueNumberSM, uniqueNumberSM) ||
                other.uniqueNumberSM == uniqueNumberSM) &&
            (identical(other.dateTimeSM, dateTimeSM) ||
                other.dateTimeSM == dateTimeSM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tableID,
      locationID,
      tableNumber,
      tableLabel,
      outletID,
      tableStatus,
      dateTime,
      transactionNumber,
      statusTransaction,
      uniqueNumberSM,
      dateTimeSM);

  /// Create a copy of TableLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableLiteModelImplCopyWith<_$TableLiteModelImpl> get copyWith =>
      __$$TableLiteModelImplCopyWithImpl<_$TableLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableLiteModelImplToJson(
      this,
    );
  }
}

abstract class _TableLiteModel implements TableLiteModel {
  const factory _TableLiteModel(
          {@JsonKey(name: 'tableID') required final int tableID,
          @JsonKey(name: 'locationID') required final int locationID,
          @JsonKey(name: 'tableNumber') required final int tableNumber,
          @JsonKey(name: 'tableLabel') required final String tableLabel,
          @JsonKey(name: 'outletID') required final int outletID,
          @JsonKey(name: 'tableStatus') required final String tableStatus,
          @JsonKey(name: 'datetime') final String? dateTime,
          @JsonKey(name: 'transactionNumber') final String? transactionNumber,
          @JsonKey(name: 'statusTransaction') final String? statusTransaction,
          @JsonKey(name: 'uniqueNumberSM') final int? uniqueNumberSM,
          @JsonKey(name: 'dateTimeSM') final String? dateTimeSM}) =
      _$TableLiteModelImpl;

  factory _TableLiteModel.fromJson(Map<String, dynamic> json) =
      _$TableLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'tableID')
  int get tableID;
  @override
  @JsonKey(name: 'locationID')
  int get locationID;
  @override
  @JsonKey(name: 'tableNumber')
  int get tableNumber;
  @override
  @JsonKey(name: 'tableLabel')
  String get tableLabel;
  @override
  @JsonKey(name: 'outletID')
  int get outletID;
  @override
  @JsonKey(name: 'tableStatus')
  String get tableStatus;
  @override
  @JsonKey(name: 'datetime')
  String? get dateTime;
  @override
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber;
  @override
  @JsonKey(name: 'statusTransaction')
  String? get statusTransaction;
  @override
  @JsonKey(name: 'uniqueNumberSM')
  int? get uniqueNumberSM;
  @override
  @JsonKey(name: 'dateTimeSM')
  String? get dateTimeSM;

  /// Create a copy of TableLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableLiteModelImplCopyWith<_$TableLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
