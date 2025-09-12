// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_transaction_sm_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionSMDetailModel _$TransactionSMDetailModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionSMDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionSMDetailModel {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  TransactionSMHeaderData? get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionSMDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSMDetailModelCopyWith<TransactionSMDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSMDetailModelCopyWith<$Res> {
  factory $TransactionSMDetailModelCopyWith(TransactionSMDetailModel value,
          $Res Function(TransactionSMDetailModel) then) =
      _$TransactionSMDetailModelCopyWithImpl<$Res, TransactionSMDetailModel>;
  @useResult
  $Res call(
      {String? status, @JsonKey(name: 'data') TransactionSMHeaderData? data});

  $TransactionSMHeaderDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionSMDetailModelCopyWithImpl<$Res,
        $Val extends TransactionSMDetailModel>
    implements $TransactionSMDetailModelCopyWith<$Res> {
  _$TransactionSMDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionSMHeaderData?,
    ) as $Val);
  }

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionSMHeaderDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TransactionSMHeaderDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionSMDetailModelImplCopyWith<$Res>
    implements $TransactionSMDetailModelCopyWith<$Res> {
  factory _$$TransactionSMDetailModelImplCopyWith(
          _$TransactionSMDetailModelImpl value,
          $Res Function(_$TransactionSMDetailModelImpl) then) =
      __$$TransactionSMDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status, @JsonKey(name: 'data') TransactionSMHeaderData? data});

  @override
  $TransactionSMHeaderDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TransactionSMDetailModelImplCopyWithImpl<$Res>
    extends _$TransactionSMDetailModelCopyWithImpl<$Res,
        _$TransactionSMDetailModelImpl>
    implements _$$TransactionSMDetailModelImplCopyWith<$Res> {
  __$$TransactionSMDetailModelImplCopyWithImpl(
      _$TransactionSMDetailModelImpl _value,
      $Res Function(_$TransactionSMDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TransactionSMDetailModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionSMHeaderData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSMDetailModelImpl implements _TransactionSMDetailModel {
  const _$TransactionSMDetailModelImpl(
      {this.status, @JsonKey(name: 'data') this.data});

  factory _$TransactionSMDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSMDetailModelImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'data')
  final TransactionSMHeaderData? data;

  @override
  String toString() {
    return 'TransactionSMDetailModel(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSMDetailModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSMDetailModelImplCopyWith<_$TransactionSMDetailModelImpl>
      get copyWith => __$$TransactionSMDetailModelImplCopyWithImpl<
          _$TransactionSMDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSMDetailModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionSMDetailModel implements TransactionSMDetailModel {
  const factory _TransactionSMDetailModel(
          {final String? status,
          @JsonKey(name: 'data') final TransactionSMHeaderData? data}) =
      _$TransactionSMDetailModelImpl;

  factory _TransactionSMDetailModel.fromJson(Map<String, dynamic> json) =
      _$TransactionSMDetailModelImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'data')
  TransactionSMHeaderData? get data;

  /// Create a copy of TransactionSMDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSMDetailModelImplCopyWith<_$TransactionSMDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionSMHeaderData _$TransactionSMHeaderDataFromJson(
    Map<String, dynamic> json) {
  return _TransactionSMHeaderData.fromJson(json);
}

/// @nodoc
mixin _$TransactionSMHeaderData {
  @JsonKey(name: 'TransactionID')
  int? get transactionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionNumber')
  String? get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Datetime')
  String? get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableID')
  String? get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableNumber')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableLabel')
  String? get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionType')
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  String? get customerID => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'UniqeNumber')
  int? get uniqueNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTransaction')
  String? get statusTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'UrlQrCode')
  String? get urlQRCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Details')
  List<TransactionSMDetailData> get details =>
      throw _privateConstructorUsedError;

  /// Serializes this TransactionSMHeaderData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSMHeaderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSMHeaderDataCopyWith<TransactionSMHeaderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSMHeaderDataCopyWith<$Res> {
  factory $TransactionSMHeaderDataCopyWith(TransactionSMHeaderData value,
          $Res Function(TransactionSMHeaderData) then) =
      _$TransactionSMHeaderDataCopyWithImpl<$Res, TransactionSMHeaderData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionID') int? transactionID,
      @JsonKey(name: 'TransactionNumber') String? transactionNumber,
      @JsonKey(name: 'Datetime') String? datetime,
      @JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'TransactionType') String? transactionType,
      @JsonKey(name: 'CustomerID') String? customerID,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'PPN') int? ppn,
      @JsonKey(name: 'Rounding') int? rounding,
      @JsonKey(name: 'SubTotal') int? subTotal,
      @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
      @JsonKey(name: 'UniqeNumber') int? uniqueNumber,
      @JsonKey(name: 'StatusTransaction') String? statusTransaction,
      @JsonKey(name: 'UrlQrCode') String? urlQRCode,
      @JsonKey(name: 'Details') List<TransactionSMDetailData> details});
}

/// @nodoc
class _$TransactionSMHeaderDataCopyWithImpl<$Res,
        $Val extends TransactionSMHeaderData>
    implements $TransactionSMHeaderDataCopyWith<$Res> {
  _$TransactionSMHeaderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSMHeaderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = freezed,
    Object? transactionNumber = freezed,
    Object? datetime = freezed,
    Object? tableID = freezed,
    Object? tableNumber = freezed,
    Object? tableLabel = freezed,
    Object? transactionType = freezed,
    Object? customerID = freezed,
    Object? customerName = freezed,
    Object? ppn = freezed,
    Object? rounding = freezed,
    Object? subTotal = freezed,
    Object? grandTotalFinal = freezed,
    Object? uniqueNumber = freezed,
    Object? statusTransaction = freezed,
    Object? urlQRCode = freezed,
    Object? details = null,
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
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
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
              as String?,
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
      uniqueNumber: freezed == uniqueNumber
          ? _value.uniqueNumber
          : uniqueNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      urlQRCode: freezed == urlQRCode
          ? _value.urlQRCode
          : urlQRCode // ignore: cast_nullable_to_non_nullable
              as String?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TransactionSMDetailData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSMHeaderDataImplCopyWith<$Res>
    implements $TransactionSMHeaderDataCopyWith<$Res> {
  factory _$$TransactionSMHeaderDataImplCopyWith(
          _$TransactionSMHeaderDataImpl value,
          $Res Function(_$TransactionSMHeaderDataImpl) then) =
      __$$TransactionSMHeaderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionID') int? transactionID,
      @JsonKey(name: 'TransactionNumber') String? transactionNumber,
      @JsonKey(name: 'Datetime') String? datetime,
      @JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'TransactionType') String? transactionType,
      @JsonKey(name: 'CustomerID') String? customerID,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'PPN') int? ppn,
      @JsonKey(name: 'Rounding') int? rounding,
      @JsonKey(name: 'SubTotal') int? subTotal,
      @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
      @JsonKey(name: 'UniqeNumber') int? uniqueNumber,
      @JsonKey(name: 'StatusTransaction') String? statusTransaction,
      @JsonKey(name: 'UrlQrCode') String? urlQRCode,
      @JsonKey(name: 'Details') List<TransactionSMDetailData> details});
}

/// @nodoc
class __$$TransactionSMHeaderDataImplCopyWithImpl<$Res>
    extends _$TransactionSMHeaderDataCopyWithImpl<$Res,
        _$TransactionSMHeaderDataImpl>
    implements _$$TransactionSMHeaderDataImplCopyWith<$Res> {
  __$$TransactionSMHeaderDataImplCopyWithImpl(
      _$TransactionSMHeaderDataImpl _value,
      $Res Function(_$TransactionSMHeaderDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSMHeaderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = freezed,
    Object? transactionNumber = freezed,
    Object? datetime = freezed,
    Object? tableID = freezed,
    Object? tableNumber = freezed,
    Object? tableLabel = freezed,
    Object? transactionType = freezed,
    Object? customerID = freezed,
    Object? customerName = freezed,
    Object? ppn = freezed,
    Object? rounding = freezed,
    Object? subTotal = freezed,
    Object? grandTotalFinal = freezed,
    Object? uniqueNumber = freezed,
    Object? statusTransaction = freezed,
    Object? urlQRCode = freezed,
    Object? details = null,
  }) {
    return _then(_$TransactionSMHeaderDataImpl(
      transactionID: freezed == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
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
              as String?,
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
      uniqueNumber: freezed == uniqueNumber
          ? _value.uniqueNumber
          : uniqueNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      urlQRCode: freezed == urlQRCode
          ? _value.urlQRCode
          : urlQRCode // ignore: cast_nullable_to_non_nullable
              as String?,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TransactionSMDetailData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSMHeaderDataImpl implements _TransactionSMHeaderData {
  const _$TransactionSMHeaderDataImpl(
      {@JsonKey(name: 'TransactionID') this.transactionID,
      @JsonKey(name: 'TransactionNumber') this.transactionNumber,
      @JsonKey(name: 'Datetime') this.datetime,
      @JsonKey(name: 'TableID') this.tableID,
      @JsonKey(name: 'TableNumber') this.tableNumber,
      @JsonKey(name: 'TableLabel') this.tableLabel,
      @JsonKey(name: 'TransactionType') this.transactionType,
      @JsonKey(name: 'CustomerID') this.customerID,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'PPN') this.ppn,
      @JsonKey(name: 'Rounding') this.rounding,
      @JsonKey(name: 'SubTotal') this.subTotal,
      @JsonKey(name: 'GrandTotalFinal') this.grandTotalFinal,
      @JsonKey(name: 'UniqeNumber') this.uniqueNumber,
      @JsonKey(name: 'StatusTransaction') this.statusTransaction,
      @JsonKey(name: 'UrlQrCode') this.urlQRCode,
      @JsonKey(name: 'Details')
      final List<TransactionSMDetailData> details = const []})
      : _details = details;

  factory _$TransactionSMHeaderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSMHeaderDataImplFromJson(json);

  @override
  @JsonKey(name: 'TransactionID')
  final int? transactionID;
  @override
  @JsonKey(name: 'TransactionNumber')
  final String? transactionNumber;
  @override
  @JsonKey(name: 'Datetime')
  final String? datetime;
  @override
  @JsonKey(name: 'TableID')
  final String? tableID;
  @override
  @JsonKey(name: 'TableNumber')
  final String? tableNumber;
  @override
  @JsonKey(name: 'TableLabel')
  final String? tableLabel;
  @override
  @JsonKey(name: 'TransactionType')
  final String? transactionType;
  @override
  @JsonKey(name: 'CustomerID')
  final String? customerID;
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
  @JsonKey(name: 'UniqeNumber')
  final int? uniqueNumber;
  @override
  @JsonKey(name: 'StatusTransaction')
  final String? statusTransaction;
  @override
  @JsonKey(name: 'UrlQrCode')
  final String? urlQRCode;
  final List<TransactionSMDetailData> _details;
  @override
  @JsonKey(name: 'Details')
  List<TransactionSMDetailData> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'TransactionSMHeaderData(transactionID: $transactionID, transactionNumber: $transactionNumber, datetime: $datetime, tableID: $tableID, tableNumber: $tableNumber, tableLabel: $tableLabel, transactionType: $transactionType, customerID: $customerID, customerName: $customerName, ppn: $ppn, rounding: $rounding, subTotal: $subTotal, grandTotalFinal: $grandTotalFinal, uniqueNumber: $uniqueNumber, statusTransaction: $statusTransaction, urlQRCode: $urlQRCode, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSMHeaderDataImpl &&
            (identical(other.transactionID, transactionID) ||
                other.transactionID == transactionID) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.grandTotalFinal, grandTotalFinal) ||
                other.grandTotalFinal == grandTotalFinal) &&
            (identical(other.uniqueNumber, uniqueNumber) ||
                other.uniqueNumber == uniqueNumber) &&
            (identical(other.statusTransaction, statusTransaction) ||
                other.statusTransaction == statusTransaction) &&
            (identical(other.urlQRCode, urlQRCode) ||
                other.urlQRCode == urlQRCode) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionID,
      transactionNumber,
      datetime,
      tableID,
      tableNumber,
      tableLabel,
      transactionType,
      customerID,
      customerName,
      ppn,
      rounding,
      subTotal,
      grandTotalFinal,
      uniqueNumber,
      statusTransaction,
      urlQRCode,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of TransactionSMHeaderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSMHeaderDataImplCopyWith<_$TransactionSMHeaderDataImpl>
      get copyWith => __$$TransactionSMHeaderDataImplCopyWithImpl<
          _$TransactionSMHeaderDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSMHeaderDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionSMHeaderData implements TransactionSMHeaderData {
  const factory _TransactionSMHeaderData(
          {@JsonKey(name: 'TransactionID') final int? transactionID,
          @JsonKey(name: 'TransactionNumber') final String? transactionNumber,
          @JsonKey(name: 'Datetime') final String? datetime,
          @JsonKey(name: 'TableID') final String? tableID,
          @JsonKey(name: 'TableNumber') final String? tableNumber,
          @JsonKey(name: 'TableLabel') final String? tableLabel,
          @JsonKey(name: 'TransactionType') final String? transactionType,
          @JsonKey(name: 'CustomerID') final String? customerID,
          @JsonKey(name: 'CustomerName') final String? customerName,
          @JsonKey(name: 'PPN') final int? ppn,
          @JsonKey(name: 'Rounding') final int? rounding,
          @JsonKey(name: 'SubTotal') final int? subTotal,
          @JsonKey(name: 'GrandTotalFinal') final int? grandTotalFinal,
          @JsonKey(name: 'UniqeNumber') final int? uniqueNumber,
          @JsonKey(name: 'StatusTransaction') final String? statusTransaction,
          @JsonKey(name: 'UrlQrCode') final String? urlQRCode,
          @JsonKey(name: 'Details')
          final List<TransactionSMDetailData> details}) =
      _$TransactionSMHeaderDataImpl;

  factory _TransactionSMHeaderData.fromJson(Map<String, dynamic> json) =
      _$TransactionSMHeaderDataImpl.fromJson;

  @override
  @JsonKey(name: 'TransactionID')
  int? get transactionID;
  @override
  @JsonKey(name: 'TransactionNumber')
  String? get transactionNumber;
  @override
  @JsonKey(name: 'Datetime')
  String? get datetime;
  @override
  @JsonKey(name: 'TableID')
  String? get tableID;
  @override
  @JsonKey(name: 'TableNumber')
  String? get tableNumber;
  @override
  @JsonKey(name: 'TableLabel')
  String? get tableLabel;
  @override
  @JsonKey(name: 'TransactionType')
  String? get transactionType;
  @override
  @JsonKey(name: 'CustomerID')
  String? get customerID;
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
  @JsonKey(name: 'UniqeNumber')
  int? get uniqueNumber;
  @override
  @JsonKey(name: 'StatusTransaction')
  String? get statusTransaction;
  @override
  @JsonKey(name: 'UrlQrCode')
  String? get urlQRCode;
  @override
  @JsonKey(name: 'Details')
  List<TransactionSMDetailData> get details;

  /// Create a copy of TransactionSMHeaderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSMHeaderDataImplCopyWith<_$TransactionSMHeaderDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionSMDetailData _$TransactionSMDetailDataFromJson(
    Map<String, dynamic> json) {
  return _TransactionSMDetailData.fromJson(json);
}

/// @nodoc
mixin _$TransactionSMDetailData {
  @JsonKey(name: 'CartID')
  int? get cartID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CartDetailID')
  int? get cartDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuID')
  int? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int? get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'SendOrder')
  int? get sendOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty')
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuPrice')
  int? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPriceItem')
  int? get totalPriceItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintKitchen')
  int? get printKitchen => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationID')
  int? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn')
  List<AddOn> get addOn => throw _privateConstructorUsedError;

  /// Serializes this TransactionSMDetailData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSMDetailData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSMDetailDataCopyWith<TransactionSMDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSMDetailDataCopyWith<$Res> {
  factory $TransactionSMDetailDataCopyWith(TransactionSMDetailData value,
          $Res Function(TransactionSMDetailData) then) =
      _$TransactionSMDetailDataCopyWithImpl<$Res, TransactionSMDetailData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CartID') int? cartID,
      @JsonKey(name: 'CartDetailID') int? cartDetailID,
      @JsonKey(name: 'MenuID') int? menuID,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'ParentID') int? parentID,
      @JsonKey(name: 'SendOrder') int? sendOrder,
      @JsonKey(name: 'Notes') String? notes,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'Qty') int? qty,
      @JsonKey(name: 'MenuPrice') int? menuPrice,
      @JsonKey(name: 'DiscountDetail') List<dynamic> discountDetail,
      @JsonKey(name: 'TotalPriceItem') int? totalPriceItem,
      @JsonKey(name: 'PrintKitchen') int? printKitchen,
      @JsonKey(name: 'StationID') int? stationID,
      @JsonKey(name: 'addOn') List<AddOn> addOn});
}

/// @nodoc
class _$TransactionSMDetailDataCopyWithImpl<$Res,
        $Val extends TransactionSMDetailData>
    implements $TransactionSMDetailDataCopyWith<$Res> {
  _$TransactionSMDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSMDetailData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartID = freezed,
    Object? cartDetailID = freezed,
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? parentID = freezed,
    Object? sendOrder = freezed,
    Object? notes = freezed,
    Object? menuImage = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? discountDetail = null,
    Object? totalPriceItem = freezed,
    Object? printKitchen = freezed,
    Object? stationID = freezed,
    Object? addOn = null,
  }) {
    return _then(_value.copyWith(
      cartID: freezed == cartID
          ? _value.cartID
          : cartID // ignore: cast_nullable_to_non_nullable
              as int?,
      cartDetailID: freezed == cartDetailID
          ? _value.cartDetailID
          : cartDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      sendOrder: freezed == sendOrder
          ? _value.sendOrder
          : sendOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountDetail: null == discountDetail
          ? _value.discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalPriceItem: freezed == totalPriceItem
          ? _value.totalPriceItem
          : totalPriceItem // ignore: cast_nullable_to_non_nullable
              as int?,
      printKitchen: freezed == printKitchen
          ? _value.printKitchen
          : printKitchen // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<AddOn>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSMDetailDataImplCopyWith<$Res>
    implements $TransactionSMDetailDataCopyWith<$Res> {
  factory _$$TransactionSMDetailDataImplCopyWith(
          _$TransactionSMDetailDataImpl value,
          $Res Function(_$TransactionSMDetailDataImpl) then) =
      __$$TransactionSMDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CartID') int? cartID,
      @JsonKey(name: 'CartDetailID') int? cartDetailID,
      @JsonKey(name: 'MenuID') int? menuID,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'ParentID') int? parentID,
      @JsonKey(name: 'SendOrder') int? sendOrder,
      @JsonKey(name: 'Notes') String? notes,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'Qty') int? qty,
      @JsonKey(name: 'MenuPrice') int? menuPrice,
      @JsonKey(name: 'DiscountDetail') List<dynamic> discountDetail,
      @JsonKey(name: 'TotalPriceItem') int? totalPriceItem,
      @JsonKey(name: 'PrintKitchen') int? printKitchen,
      @JsonKey(name: 'StationID') int? stationID,
      @JsonKey(name: 'addOn') List<AddOn> addOn});
}

/// @nodoc
class __$$TransactionSMDetailDataImplCopyWithImpl<$Res>
    extends _$TransactionSMDetailDataCopyWithImpl<$Res,
        _$TransactionSMDetailDataImpl>
    implements _$$TransactionSMDetailDataImplCopyWith<$Res> {
  __$$TransactionSMDetailDataImplCopyWithImpl(
      _$TransactionSMDetailDataImpl _value,
      $Res Function(_$TransactionSMDetailDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSMDetailData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartID = freezed,
    Object? cartDetailID = freezed,
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? parentID = freezed,
    Object? sendOrder = freezed,
    Object? notes = freezed,
    Object? menuImage = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? discountDetail = null,
    Object? totalPriceItem = freezed,
    Object? printKitchen = freezed,
    Object? stationID = freezed,
    Object? addOn = null,
  }) {
    return _then(_$TransactionSMDetailDataImpl(
      cartID: freezed == cartID
          ? _value.cartID
          : cartID // ignore: cast_nullable_to_non_nullable
              as int?,
      cartDetailID: freezed == cartDetailID
          ? _value.cartDetailID
          : cartDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      sendOrder: freezed == sendOrder
          ? _value.sendOrder
          : sendOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountDetail: null == discountDetail
          ? _value._discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalPriceItem: freezed == totalPriceItem
          ? _value.totalPriceItem
          : totalPriceItem // ignore: cast_nullable_to_non_nullable
              as int?,
      printKitchen: freezed == printKitchen
          ? _value.printKitchen
          : printKitchen // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<AddOn>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSMDetailDataImpl implements _TransactionSMDetailData {
  const _$TransactionSMDetailDataImpl(
      {@JsonKey(name: 'CartID') this.cartID,
      @JsonKey(name: 'CartDetailID') this.cartDetailID,
      @JsonKey(name: 'MenuID') this.menuID,
      @JsonKey(name: 'MenuName') this.menuName,
      @JsonKey(name: 'ParentID') this.parentID,
      @JsonKey(name: 'SendOrder') this.sendOrder,
      @JsonKey(name: 'Notes') this.notes,
      @JsonKey(name: 'MenuImage') this.menuImage,
      @JsonKey(name: 'Qty') this.qty,
      @JsonKey(name: 'MenuPrice') this.menuPrice,
      @JsonKey(name: 'DiscountDetail')
      final List<dynamic> discountDetail = const [],
      @JsonKey(name: 'TotalPriceItem') this.totalPriceItem,
      @JsonKey(name: 'PrintKitchen') this.printKitchen,
      @JsonKey(name: 'StationID') this.stationID,
      @JsonKey(name: 'addOn') final List<AddOn> addOn = const []})
      : _discountDetail = discountDetail,
        _addOn = addOn;

  factory _$TransactionSMDetailDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSMDetailDataImplFromJson(json);

  @override
  @JsonKey(name: 'CartID')
  final int? cartID;
  @override
  @JsonKey(name: 'CartDetailID')
  final int? cartDetailID;
  @override
  @JsonKey(name: 'MenuID')
  final int? menuID;
  @override
  @JsonKey(name: 'MenuName')
  final String? menuName;
  @override
  @JsonKey(name: 'ParentID')
  final int? parentID;
  @override
  @JsonKey(name: 'SendOrder')
  final int? sendOrder;
  @override
  @JsonKey(name: 'Notes')
  final String? notes;
  @override
  @JsonKey(name: 'MenuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'Qty')
  final int? qty;
  @override
  @JsonKey(name: 'MenuPrice')
  final int? menuPrice;
  final List<dynamic> _discountDetail;
  @override
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail {
    if (_discountDetail is EqualUnmodifiableListView) return _discountDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountDetail);
  }

  @override
  @JsonKey(name: 'TotalPriceItem')
  final int? totalPriceItem;
  @override
  @JsonKey(name: 'PrintKitchen')
  final int? printKitchen;
  @override
  @JsonKey(name: 'StationID')
  final int? stationID;
  final List<AddOn> _addOn;
  @override
  @JsonKey(name: 'addOn')
  List<AddOn> get addOn {
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOn);
  }

  @override
  String toString() {
    return 'TransactionSMDetailData(cartID: $cartID, cartDetailID: $cartDetailID, menuID: $menuID, menuName: $menuName, parentID: $parentID, sendOrder: $sendOrder, notes: $notes, menuImage: $menuImage, qty: $qty, menuPrice: $menuPrice, discountDetail: $discountDetail, totalPriceItem: $totalPriceItem, printKitchen: $printKitchen, stationID: $stationID, addOn: $addOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSMDetailDataImpl &&
            (identical(other.cartID, cartID) || other.cartID == cartID) &&
            (identical(other.cartDetailID, cartDetailID) ||
                other.cartDetailID == cartDetailID) &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.sendOrder, sendOrder) ||
                other.sendOrder == sendOrder) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            const DeepCollectionEquality()
                .equals(other._discountDetail, _discountDetail) &&
            (identical(other.totalPriceItem, totalPriceItem) ||
                other.totalPriceItem == totalPriceItem) &&
            (identical(other.printKitchen, printKitchen) ||
                other.printKitchen == printKitchen) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartID,
      cartDetailID,
      menuID,
      menuName,
      parentID,
      sendOrder,
      notes,
      menuImage,
      qty,
      menuPrice,
      const DeepCollectionEquality().hash(_discountDetail),
      totalPriceItem,
      printKitchen,
      stationID,
      const DeepCollectionEquality().hash(_addOn));

  /// Create a copy of TransactionSMDetailData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSMDetailDataImplCopyWith<_$TransactionSMDetailDataImpl>
      get copyWith => __$$TransactionSMDetailDataImplCopyWithImpl<
          _$TransactionSMDetailDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSMDetailDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionSMDetailData implements TransactionSMDetailData {
  const factory _TransactionSMDetailData(
          {@JsonKey(name: 'CartID') final int? cartID,
          @JsonKey(name: 'CartDetailID') final int? cartDetailID,
          @JsonKey(name: 'MenuID') final int? menuID,
          @JsonKey(name: 'MenuName') final String? menuName,
          @JsonKey(name: 'ParentID') final int? parentID,
          @JsonKey(name: 'SendOrder') final int? sendOrder,
          @JsonKey(name: 'Notes') final String? notes,
          @JsonKey(name: 'MenuImage') final String? menuImage,
          @JsonKey(name: 'Qty') final int? qty,
          @JsonKey(name: 'MenuPrice') final int? menuPrice,
          @JsonKey(name: 'DiscountDetail') final List<dynamic> discountDetail,
          @JsonKey(name: 'TotalPriceItem') final int? totalPriceItem,
          @JsonKey(name: 'PrintKitchen') final int? printKitchen,
          @JsonKey(name: 'StationID') final int? stationID,
          @JsonKey(name: 'addOn') final List<AddOn> addOn}) =
      _$TransactionSMDetailDataImpl;

  factory _TransactionSMDetailData.fromJson(Map<String, dynamic> json) =
      _$TransactionSMDetailDataImpl.fromJson;

  @override
  @JsonKey(name: 'CartID')
  int? get cartID;
  @override
  @JsonKey(name: 'CartDetailID')
  int? get cartDetailID;
  @override
  @JsonKey(name: 'MenuID')
  int? get menuID;
  @override
  @JsonKey(name: 'MenuName')
  String? get menuName;
  @override
  @JsonKey(name: 'ParentID')
  int? get parentID;
  @override
  @JsonKey(name: 'SendOrder')
  int? get sendOrder;
  @override
  @JsonKey(name: 'Notes')
  String? get notes;
  @override
  @JsonKey(name: 'MenuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'Qty')
  int? get qty;
  @override
  @JsonKey(name: 'MenuPrice')
  int? get menuPrice;
  @override
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail;
  @override
  @JsonKey(name: 'TotalPriceItem')
  int? get totalPriceItem;
  @override
  @JsonKey(name: 'PrintKitchen')
  int? get printKitchen;
  @override
  @JsonKey(name: 'StationID')
  int? get stationID;
  @override
  @JsonKey(name: 'addOn')
  List<AddOn> get addOn;

  /// Create a copy of TransactionSMDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSMDetailDataImplCopyWith<_$TransactionSMDetailDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AddOn _$AddOnFromJson(Map<String, dynamic> json) {
  return _AddOn.fromJson(json);
}

/// @nodoc
mixin _$AddOn {
  @JsonKey(name: 'MenuID')
  int? get menuId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SendOrder')
  int? get sendOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty')
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuPrice')
  int? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintKitchen')
  int? get printKitchen => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationID')
  int? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPriceItem')
  int? get totalPriceItem => throw _privateConstructorUsedError;

  /// Serializes this AddOn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddOn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddOnCopyWith<AddOn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOnCopyWith<$Res> {
  factory $AddOnCopyWith(AddOn value, $Res Function(AddOn) then) =
      _$AddOnCopyWithImpl<$Res, AddOn>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') int? menuId,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'SendOrder') int? sendOrder,
      @JsonKey(name: 'Notes') String? notes,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'Qty') int? qty,
      @JsonKey(name: 'MenuPrice') int? menuPrice,
      @JsonKey(name: 'PrintKitchen') int? printKitchen,
      @JsonKey(name: 'StationID') int? stationID,
      @JsonKey(name: 'DiscountDetail') List<dynamic> discountDetail,
      @JsonKey(name: 'TotalPriceItem') int? totalPriceItem});
}

/// @nodoc
class _$AddOnCopyWithImpl<$Res, $Val extends AddOn>
    implements $AddOnCopyWith<$Res> {
  _$AddOnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddOn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = freezed,
    Object? menuName = freezed,
    Object? sendOrder = freezed,
    Object? notes = freezed,
    Object? menuImage = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? printKitchen = freezed,
    Object? stationID = freezed,
    Object? discountDetail = null,
    Object? totalPriceItem = freezed,
  }) {
    return _then(_value.copyWith(
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      sendOrder: freezed == sendOrder
          ? _value.sendOrder
          : sendOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      printKitchen: freezed == printKitchen
          ? _value.printKitchen
          : printKitchen // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      discountDetail: null == discountDetail
          ? _value.discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalPriceItem: freezed == totalPriceItem
          ? _value.totalPriceItem
          : totalPriceItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddOnImplCopyWith<$Res> implements $AddOnCopyWith<$Res> {
  factory _$$AddOnImplCopyWith(
          _$AddOnImpl value, $Res Function(_$AddOnImpl) then) =
      __$$AddOnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') int? menuId,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'SendOrder') int? sendOrder,
      @JsonKey(name: 'Notes') String? notes,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'Qty') int? qty,
      @JsonKey(name: 'MenuPrice') int? menuPrice,
      @JsonKey(name: 'PrintKitchen') int? printKitchen,
      @JsonKey(name: 'StationID') int? stationID,
      @JsonKey(name: 'DiscountDetail') List<dynamic> discountDetail,
      @JsonKey(name: 'TotalPriceItem') int? totalPriceItem});
}

/// @nodoc
class __$$AddOnImplCopyWithImpl<$Res>
    extends _$AddOnCopyWithImpl<$Res, _$AddOnImpl>
    implements _$$AddOnImplCopyWith<$Res> {
  __$$AddOnImplCopyWithImpl(
      _$AddOnImpl _value, $Res Function(_$AddOnImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddOn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = freezed,
    Object? menuName = freezed,
    Object? sendOrder = freezed,
    Object? notes = freezed,
    Object? menuImage = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? printKitchen = freezed,
    Object? stationID = freezed,
    Object? discountDetail = null,
    Object? totalPriceItem = freezed,
  }) {
    return _then(_$AddOnImpl(
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      sendOrder: freezed == sendOrder
          ? _value.sendOrder
          : sendOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      printKitchen: freezed == printKitchen
          ? _value.printKitchen
          : printKitchen // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      discountDetail: null == discountDetail
          ? _value._discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalPriceItem: freezed == totalPriceItem
          ? _value.totalPriceItem
          : totalPriceItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddOnImpl implements _AddOn {
  const _$AddOnImpl(
      {@JsonKey(name: 'MenuID') this.menuId,
      @JsonKey(name: 'MenuName') this.menuName,
      @JsonKey(name: 'SendOrder') this.sendOrder,
      @JsonKey(name: 'Notes') this.notes,
      @JsonKey(name: 'MenuImage') this.menuImage,
      @JsonKey(name: 'Qty') this.qty,
      @JsonKey(name: 'MenuPrice') this.menuPrice,
      @JsonKey(name: 'PrintKitchen') this.printKitchen,
      @JsonKey(name: 'StationID') this.stationID,
      @JsonKey(name: 'DiscountDetail')
      final List<dynamic> discountDetail = const [],
      @JsonKey(name: 'TotalPriceItem') this.totalPriceItem})
      : _discountDetail = discountDetail;

  factory _$AddOnImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddOnImplFromJson(json);

  @override
  @JsonKey(name: 'MenuID')
  final int? menuId;
  @override
  @JsonKey(name: 'MenuName')
  final String? menuName;
  @override
  @JsonKey(name: 'SendOrder')
  final int? sendOrder;
  @override
  @JsonKey(name: 'Notes')
  final String? notes;
  @override
  @JsonKey(name: 'MenuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'Qty')
  final int? qty;
  @override
  @JsonKey(name: 'MenuPrice')
  final int? menuPrice;
  @override
  @JsonKey(name: 'PrintKitchen')
  final int? printKitchen;
  @override
  @JsonKey(name: 'StationID')
  final int? stationID;
  final List<dynamic> _discountDetail;
  @override
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail {
    if (_discountDetail is EqualUnmodifiableListView) return _discountDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountDetail);
  }

  @override
  @JsonKey(name: 'TotalPriceItem')
  final int? totalPriceItem;

  @override
  String toString() {
    return 'AddOn(menuId: $menuId, menuName: $menuName, sendOrder: $sendOrder, notes: $notes, menuImage: $menuImage, qty: $qty, menuPrice: $menuPrice, printKitchen: $printKitchen, stationID: $stationID, discountDetail: $discountDetail, totalPriceItem: $totalPriceItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOnImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.sendOrder, sendOrder) ||
                other.sendOrder == sendOrder) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.printKitchen, printKitchen) ||
                other.printKitchen == printKitchen) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            const DeepCollectionEquality()
                .equals(other._discountDetail, _discountDetail) &&
            (identical(other.totalPriceItem, totalPriceItem) ||
                other.totalPriceItem == totalPriceItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      menuId,
      menuName,
      sendOrder,
      notes,
      menuImage,
      qty,
      menuPrice,
      printKitchen,
      stationID,
      const DeepCollectionEquality().hash(_discountDetail),
      totalPriceItem);

  /// Create a copy of AddOn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOnImplCopyWith<_$AddOnImpl> get copyWith =>
      __$$AddOnImplCopyWithImpl<_$AddOnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddOnImplToJson(
      this,
    );
  }
}

abstract class _AddOn implements AddOn {
  const factory _AddOn(
          {@JsonKey(name: 'MenuID') final int? menuId,
          @JsonKey(name: 'MenuName') final String? menuName,
          @JsonKey(name: 'SendOrder') final int? sendOrder,
          @JsonKey(name: 'Notes') final String? notes,
          @JsonKey(name: 'MenuImage') final String? menuImage,
          @JsonKey(name: 'Qty') final int? qty,
          @JsonKey(name: 'MenuPrice') final int? menuPrice,
          @JsonKey(name: 'PrintKitchen') final int? printKitchen,
          @JsonKey(name: 'StationID') final int? stationID,
          @JsonKey(name: 'DiscountDetail') final List<dynamic> discountDetail,
          @JsonKey(name: 'TotalPriceItem') final int? totalPriceItem}) =
      _$AddOnImpl;

  factory _AddOn.fromJson(Map<String, dynamic> json) = _$AddOnImpl.fromJson;

  @override
  @JsonKey(name: 'MenuID')
  int? get menuId;
  @override
  @JsonKey(name: 'MenuName')
  String? get menuName;
  @override
  @JsonKey(name: 'SendOrder')
  int? get sendOrder;
  @override
  @JsonKey(name: 'Notes')
  String? get notes;
  @override
  @JsonKey(name: 'MenuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'Qty')
  int? get qty;
  @override
  @JsonKey(name: 'MenuPrice')
  int? get menuPrice;
  @override
  @JsonKey(name: 'PrintKitchen')
  int? get printKitchen;
  @override
  @JsonKey(name: 'StationID')
  int? get stationID;
  @override
  @JsonKey(name: 'DiscountDetail')
  List<dynamic> get discountDetail;
  @override
  @JsonKey(name: 'TotalPriceItem')
  int? get totalPriceItem;

  /// Create a copy of AddOn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddOnImplCopyWith<_$AddOnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
