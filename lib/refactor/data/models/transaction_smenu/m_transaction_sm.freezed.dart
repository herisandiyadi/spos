// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_transaction_sm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionSMModel _$TransactionSMModelFromJson(Map<String, dynamic> json) {
  return _TransactionSMModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionSMModel {
  String? get status => throw _privateConstructorUsedError;
  List<TransactionSMData> get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionSMModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSMModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSMModelCopyWith<TransactionSMModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSMModelCopyWith<$Res> {
  factory $TransactionSMModelCopyWith(
          TransactionSMModel value, $Res Function(TransactionSMModel) then) =
      _$TransactionSMModelCopyWithImpl<$Res, TransactionSMModel>;
  @useResult
  $Res call({String? status, List<TransactionSMData> data});
}

/// @nodoc
class _$TransactionSMModelCopyWithImpl<$Res, $Val extends TransactionSMModel>
    implements $TransactionSMModelCopyWith<$Res> {
  _$TransactionSMModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSMModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionSMData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSMModelImplCopyWith<$Res>
    implements $TransactionSMModelCopyWith<$Res> {
  factory _$$TransactionSMModelImplCopyWith(_$TransactionSMModelImpl value,
          $Res Function(_$TransactionSMModelImpl) then) =
      __$$TransactionSMModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, List<TransactionSMData> data});
}

/// @nodoc
class __$$TransactionSMModelImplCopyWithImpl<$Res>
    extends _$TransactionSMModelCopyWithImpl<$Res, _$TransactionSMModelImpl>
    implements _$$TransactionSMModelImplCopyWith<$Res> {
  __$$TransactionSMModelImplCopyWithImpl(_$TransactionSMModelImpl _value,
      $Res Function(_$TransactionSMModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSMModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = null,
  }) {
    return _then(_$TransactionSMModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionSMData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSMModelImpl implements _TransactionSMModel {
  const _$TransactionSMModelImpl(
      {this.status, required final List<TransactionSMData> data})
      : _data = data;

  factory _$TransactionSMModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSMModelImplFromJson(json);

  @override
  final String? status;
  final List<TransactionSMData> _data;
  @override
  List<TransactionSMData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TransactionSMModel(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSMModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TransactionSMModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSMModelImplCopyWith<_$TransactionSMModelImpl> get copyWith =>
      __$$TransactionSMModelImplCopyWithImpl<_$TransactionSMModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSMModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionSMModel implements TransactionSMModel {
  const factory _TransactionSMModel(
      {final String? status,
      required final List<TransactionSMData> data}) = _$TransactionSMModelImpl;

  factory _TransactionSMModel.fromJson(Map<String, dynamic> json) =
      _$TransactionSMModelImpl.fromJson;

  @override
  String? get status;
  @override
  List<TransactionSMData> get data;

  /// Create a copy of TransactionSMModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSMModelImplCopyWith<_$TransactionSMModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionSMData _$TransactionSMDataFromJson(Map<String, dynamic> json) {
  return _TransactionSMData.fromJson(json);
}

/// @nodoc
mixin _$TransactionSMData {
  @JsonKey(name: 'TransactionID')
  int? get transactionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionNumber')
  String? get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'UrlQrCode')
  String? get urlQRCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Datetime')
  String? get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableNumber')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableID')
  String? get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableLabel')
  String? get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionType')
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  dynamic get customerID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PPN')
  int? get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rounding')
  int? get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubTotal')
  int? get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'GrandTotalFinal')
  int? get grandTotalFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniqeNumber', fromJson: _toNum)
  num? get uniqeNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTransaction')
  String? get statusTransaction => throw _privateConstructorUsedError;

  /// Serializes this TransactionSMData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSMData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSMDataCopyWith<TransactionSMData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSMDataCopyWith<$Res> {
  factory $TransactionSMDataCopyWith(
          TransactionSMData value, $Res Function(TransactionSMData) then) =
      _$TransactionSMDataCopyWithImpl<$Res, TransactionSMData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionID') int? transactionID,
      @JsonKey(name: 'TransactionNumber') String? transactionNumber,
      @JsonKey(name: 'UrlQrCode') String? urlQRCode,
      @JsonKey(name: 'Datetime') String? datetime,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'TransactionType') String? transactionType,
      @JsonKey(name: 'CustomerID') dynamic customerID,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'PPN') int? ppn,
      @JsonKey(name: 'Rounding') int? rounding,
      @JsonKey(name: 'SubTotal') int? subTotal,
      @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
      @JsonKey(name: 'UniqeNumber', fromJson: _toNum) num? uniqeNumber,
      @JsonKey(name: 'StatusTransaction') String? statusTransaction});
}

/// @nodoc
class _$TransactionSMDataCopyWithImpl<$Res, $Val extends TransactionSMData>
    implements $TransactionSMDataCopyWith<$Res> {
  _$TransactionSMDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSMData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = freezed,
    Object? transactionNumber = freezed,
    Object? urlQRCode = freezed,
    Object? datetime = freezed,
    Object? tableNumber = freezed,
    Object? tableID = freezed,
    Object? tableLabel = freezed,
    Object? transactionType = freezed,
    Object? customerID = freezed,
    Object? customerName = freezed,
    Object? ppn = freezed,
    Object? rounding = freezed,
    Object? subTotal = freezed,
    Object? grandTotalFinal = freezed,
    Object? uniqeNumber = freezed,
    Object? statusTransaction = freezed,
  }) {
    return _then(_value.copyWith(
      transactionID: freezed == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      urlQRCode: freezed == urlQRCode
          ? _value.urlQRCode
          : urlQRCode // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerID: freezed == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ppn: freezed == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int?,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalFinal: freezed == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int?,
      uniqeNumber: freezed == uniqeNumber
          ? _value.uniqeNumber
          : uniqeNumber // ignore: cast_nullable_to_non_nullable
              as num?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSMDataImplCopyWith<$Res>
    implements $TransactionSMDataCopyWith<$Res> {
  factory _$$TransactionSMDataImplCopyWith(_$TransactionSMDataImpl value,
          $Res Function(_$TransactionSMDataImpl) then) =
      __$$TransactionSMDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionID') int? transactionID,
      @JsonKey(name: 'TransactionNumber') String? transactionNumber,
      @JsonKey(name: 'UrlQrCode') String? urlQRCode,
      @JsonKey(name: 'Datetime') String? datetime,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'TransactionType') String? transactionType,
      @JsonKey(name: 'CustomerID') dynamic customerID,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'PPN') int? ppn,
      @JsonKey(name: 'Rounding') int? rounding,
      @JsonKey(name: 'SubTotal') int? subTotal,
      @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
      @JsonKey(name: 'UniqeNumber', fromJson: _toNum) num? uniqeNumber,
      @JsonKey(name: 'StatusTransaction') String? statusTransaction});
}

/// @nodoc
class __$$TransactionSMDataImplCopyWithImpl<$Res>
    extends _$TransactionSMDataCopyWithImpl<$Res, _$TransactionSMDataImpl>
    implements _$$TransactionSMDataImplCopyWith<$Res> {
  __$$TransactionSMDataImplCopyWithImpl(_$TransactionSMDataImpl _value,
      $Res Function(_$TransactionSMDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSMData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = freezed,
    Object? transactionNumber = freezed,
    Object? urlQRCode = freezed,
    Object? datetime = freezed,
    Object? tableNumber = freezed,
    Object? tableID = freezed,
    Object? tableLabel = freezed,
    Object? transactionType = freezed,
    Object? customerID = freezed,
    Object? customerName = freezed,
    Object? ppn = freezed,
    Object? rounding = freezed,
    Object? subTotal = freezed,
    Object? grandTotalFinal = freezed,
    Object? uniqeNumber = freezed,
    Object? statusTransaction = freezed,
  }) {
    return _then(_$TransactionSMDataImpl(
      transactionID: freezed == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      urlQRCode: freezed == urlQRCode
          ? _value.urlQRCode
          : urlQRCode // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerID: freezed == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ppn: freezed == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int?,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalFinal: freezed == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int?,
      uniqeNumber: freezed == uniqeNumber
          ? _value.uniqeNumber
          : uniqeNumber // ignore: cast_nullable_to_non_nullable
              as num?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSMDataImpl implements _TransactionSMData {
  const _$TransactionSMDataImpl(
      {@JsonKey(name: 'TransactionID') this.transactionID,
      @JsonKey(name: 'TransactionNumber') this.transactionNumber,
      @JsonKey(name: 'UrlQrCode') this.urlQRCode,
      @JsonKey(name: 'Datetime') this.datetime,
      @JsonKey(name: 'TableNumber') this.tableNumber,
      @JsonKey(name: 'TableID') this.tableID,
      @JsonKey(name: 'TableLabel') this.tableLabel,
      @JsonKey(name: 'TransactionType') this.transactionType,
      @JsonKey(name: 'CustomerID') this.customerID,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'PPN') this.ppn,
      @JsonKey(name: 'Rounding') this.rounding,
      @JsonKey(name: 'SubTotal') this.subTotal,
      @JsonKey(name: 'GrandTotalFinal') this.grandTotalFinal,
      @JsonKey(name: 'UniqeNumber', fromJson: _toNum) this.uniqeNumber,
      @JsonKey(name: 'StatusTransaction') this.statusTransaction});

  factory _$TransactionSMDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSMDataImplFromJson(json);

  @override
  @JsonKey(name: 'TransactionID')
  final int? transactionID;
  @override
  @JsonKey(name: 'TransactionNumber')
  final String? transactionNumber;
  @override
  @JsonKey(name: 'UrlQrCode')
  final String? urlQRCode;
  @override
  @JsonKey(name: 'Datetime')
  final String? datetime;
  @override
  @JsonKey(name: 'TableNumber')
  final String? tableNumber;
  @override
  @JsonKey(name: 'TableID')
  final String? tableID;
  @override
  @JsonKey(name: 'TableLabel')
  final String? tableLabel;
  @override
  @JsonKey(name: 'TransactionType')
  final String? transactionType;
  @override
  @JsonKey(name: 'CustomerID')
  final dynamic customerID;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'PPN')
  final int? ppn;
  @override
  @JsonKey(name: 'Rounding')
  final int? rounding;
  @override
  @JsonKey(name: 'SubTotal')
  final int? subTotal;
  @override
  @JsonKey(name: 'GrandTotalFinal')
  final int? grandTotalFinal;
  @override
  @JsonKey(name: 'UniqeNumber', fromJson: _toNum)
  final num? uniqeNumber;
  @override
  @JsonKey(name: 'StatusTransaction')
  final String? statusTransaction;

  @override
  String toString() {
    return 'TransactionSMData(transactionID: $transactionID, transactionNumber: $transactionNumber, urlQRCode: $urlQRCode, datetime: $datetime, tableNumber: $tableNumber, tableID: $tableID, tableLabel: $tableLabel, transactionType: $transactionType, customerID: $customerID, customerName: $customerName, ppn: $ppn, rounding: $rounding, subTotal: $subTotal, grandTotalFinal: $grandTotalFinal, uniqeNumber: $uniqeNumber, statusTransaction: $statusTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSMDataImpl &&
            (identical(other.transactionID, transactionID) ||
                other.transactionID == transactionID) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.urlQRCode, urlQRCode) ||
                other.urlQRCode == urlQRCode) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            const DeepCollectionEquality()
                .equals(other.customerID, customerID) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.grandTotalFinal, grandTotalFinal) ||
                other.grandTotalFinal == grandTotalFinal) &&
            (identical(other.uniqeNumber, uniqeNumber) ||
                other.uniqeNumber == uniqeNumber) &&
            (identical(other.statusTransaction, statusTransaction) ||
                other.statusTransaction == statusTransaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionID,
      transactionNumber,
      urlQRCode,
      datetime,
      tableNumber,
      tableID,
      tableLabel,
      transactionType,
      const DeepCollectionEquality().hash(customerID),
      customerName,
      ppn,
      rounding,
      subTotal,
      grandTotalFinal,
      uniqeNumber,
      statusTransaction);

  /// Create a copy of TransactionSMData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSMDataImplCopyWith<_$TransactionSMDataImpl> get copyWith =>
      __$$TransactionSMDataImplCopyWithImpl<_$TransactionSMDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSMDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionSMData implements TransactionSMData {
  const factory _TransactionSMData(
      {@JsonKey(name: 'TransactionID') final int? transactionID,
      @JsonKey(name: 'TransactionNumber') final String? transactionNumber,
      @JsonKey(name: 'UrlQrCode') final String? urlQRCode,
      @JsonKey(name: 'Datetime') final String? datetime,
      @JsonKey(name: 'TableNumber') final String? tableNumber,
      @JsonKey(name: 'TableID') final String? tableID,
      @JsonKey(name: 'TableLabel') final String? tableLabel,
      @JsonKey(name: 'TransactionType') final String? transactionType,
      @JsonKey(name: 'CustomerID') final dynamic customerID,
      @JsonKey(name: 'CustomerName') final String? customerName,
      @JsonKey(name: 'PPN') final int? ppn,
      @JsonKey(name: 'Rounding') final int? rounding,
      @JsonKey(name: 'SubTotal') final int? subTotal,
      @JsonKey(name: 'GrandTotalFinal') final int? grandTotalFinal,
      @JsonKey(name: 'UniqeNumber', fromJson: _toNum) final num? uniqeNumber,
      @JsonKey(name: 'StatusTransaction')
      final String? statusTransaction}) = _$TransactionSMDataImpl;

  factory _TransactionSMData.fromJson(Map<String, dynamic> json) =
      _$TransactionSMDataImpl.fromJson;

  @override
  @JsonKey(name: 'TransactionID')
  int? get transactionID;
  @override
  @JsonKey(name: 'TransactionNumber')
  String? get transactionNumber;
  @override
  @JsonKey(name: 'UrlQrCode')
  String? get urlQRCode;
  @override
  @JsonKey(name: 'Datetime')
  String? get datetime;
  @override
  @JsonKey(name: 'TableNumber')
  String? get tableNumber;
  @override
  @JsonKey(name: 'TableID')
  String? get tableID;
  @override
  @JsonKey(name: 'TableLabel')
  String? get tableLabel;
  @override
  @JsonKey(name: 'TransactionType')
  String? get transactionType;
  @override
  @JsonKey(name: 'CustomerID')
  dynamic get customerID;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'PPN')
  int? get ppn;
  @override
  @JsonKey(name: 'Rounding')
  int? get rounding;
  @override
  @JsonKey(name: 'SubTotal')
  int? get subTotal;
  @override
  @JsonKey(name: 'GrandTotalFinal')
  int? get grandTotalFinal;
  @override
  @JsonKey(name: 'UniqeNumber', fromJson: _toNum)
  num? get uniqeNumber;
  @override
  @JsonKey(name: 'StatusTransaction')
  String? get statusTransaction;

  /// Create a copy of TransactionSMData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSMDataImplCopyWith<_$TransactionSMDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
