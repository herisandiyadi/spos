// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionLiteModel _$TransactionLiteModelFromJson(Map<String, dynamic> json) {
  return _TransactionLiteModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionLiteModel {
  @JsonKey(name: 'transactionID')
  int get transactionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String? get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletName')
  String? get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerID')
  int get customerID => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableID')
  int get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableLabel')
  String? get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'guestNumber')
  int get guestNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionType')
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'subTotal')
  int get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountTotal')
  int get discountTotal => throw _privateConstructorUsedError;
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail =>
      throw _privateConstructorUsedError;
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'grandTotalBeforeTax')
  int get grandTotalBeforeTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn')
  int get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppnName')
  String? get ppnName => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceCharge')
  int get serviceCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageNService')
  int get packageNService => throw _privateConstructorUsedError;
  @JsonKey(name: 'grandTotalAfterTax')
  int get grandTotalAfterTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'rounding')
  int get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'grandTotalFinal')
  int get grandTotalFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'posLoginID')
  int get posLoginID => throw _privateConstructorUsedError;
  @JsonKey(name: 'closeBillStaffID')
  int get closeBillStaffID => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusTransaction')
  String? get statusTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusSync')
  int get statusSync => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusReceipt')
  int get statusReceipt => throw _privateConstructorUsedError;

  /// Serializes this TransactionLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionLiteModelCopyWith<TransactionLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLiteModelCopyWith<$Res> {
  factory $TransactionLiteModelCopyWith(TransactionLiteModel value,
          $Res Function(TransactionLiteModel) then) =
      _$TransactionLiteModelCopyWithImpl<$Res, TransactionLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionID') int transactionID,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'outletName') String? outletName,
      @JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String? customerCode,
      @JsonKey(name: 'customerName') String? customerName,
      @JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'tableLabel') String? tableLabel,
      @JsonKey(name: 'guestNumber') int guestNumber,
      @JsonKey(name: 'transactionType') String? transactionType,
      @JsonKey(name: 'subTotal') int subTotal,
      @JsonKey(name: 'discountTotal') int discountTotal,
      @ListMapConverter() List<Map<String, dynamic>> discountOnDetail,
      @ListMapConverter() List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'grandTotalBeforeTax') int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'ppnName') String? ppnName,
      @JsonKey(name: 'serviceCharge') int serviceCharge,
      @JsonKey(name: 'packageNService') int packageNService,
      @JsonKey(name: 'grandTotalAfterTax') int grandTotalAfterTax,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'grandTotalFinal') int grandTotalFinal,
      @JsonKey(name: 'posLoginID') int posLoginID,
      @JsonKey(name: 'closeBillStaffID') int closeBillStaffID,
      @JsonKey(name: 'paymentMethod') String? paymentMethod,
      @JsonKey(name: 'statusTransaction') String? statusTransaction,
      @JsonKey(name: 'statusSync') int statusSync,
      @JsonKey(name: 'statusReceipt') int statusReceipt});
}

/// @nodoc
class _$TransactionLiteModelCopyWithImpl<$Res,
        $Val extends TransactionLiteModel>
    implements $TransactionLiteModelCopyWith<$Res> {
  _$TransactionLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = null,
    Object? transactionNumber = freezed,
    Object? datetime = freezed,
    Object? outletName = freezed,
    Object? customerID = null,
    Object? customerCode = freezed,
    Object? customerName = freezed,
    Object? tableID = null,
    Object? tableLabel = freezed,
    Object? guestNumber = null,
    Object? transactionType = freezed,
    Object? subTotal = null,
    Object? discountTotal = null,
    Object? discountOnDetail = null,
    Object? discountOnTrans = null,
    Object? grandTotalBeforeTax = null,
    Object? ppn = null,
    Object? ppnName = freezed,
    Object? serviceCharge = null,
    Object? packageNService = null,
    Object? grandTotalAfterTax = null,
    Object? rounding = null,
    Object? grandTotalFinal = null,
    Object? posLoginID = null,
    Object? closeBillStaffID = null,
    Object? paymentMethod = freezed,
    Object? statusTransaction = freezed,
    Object? statusSync = null,
    Object? statusReceipt = null,
  }) {
    return _then(_value.copyWith(
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountOnDetail: null == discountOnDetail
          ? _value.discountOnDetail
          : discountOnDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountOnTrans: null == discountOnTrans
          ? _value.discountOnTrans
          : discountOnTrans // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      grandTotalBeforeTax: null == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
      ppnName: freezed == ppnName
          ? _value.ppnName
          : ppnName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCharge: null == serviceCharge
          ? _value.serviceCharge
          : serviceCharge // ignore: cast_nullable_to_non_nullable
              as int,
      packageNService: null == packageNService
          ? _value.packageNService
          : packageNService // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotalAfterTax: null == grandTotalAfterTax
          ? _value.grandTotalAfterTax
          : grandTotalAfterTax // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotalFinal: null == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int,
      posLoginID: null == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as int,
      closeBillStaffID: null == closeBillStaffID
          ? _value.closeBillStaffID
          : closeBillStaffID // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      statusSync: null == statusSync
          ? _value.statusSync
          : statusSync // ignore: cast_nullable_to_non_nullable
              as int,
      statusReceipt: null == statusReceipt
          ? _value.statusReceipt
          : statusReceipt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionLiteModelImplCopyWith<$Res>
    implements $TransactionLiteModelCopyWith<$Res> {
  factory _$$TransactionLiteModelImplCopyWith(_$TransactionLiteModelImpl value,
          $Res Function(_$TransactionLiteModelImpl) then) =
      __$$TransactionLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionID') int transactionID,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'outletName') String? outletName,
      @JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String? customerCode,
      @JsonKey(name: 'customerName') String? customerName,
      @JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'tableLabel') String? tableLabel,
      @JsonKey(name: 'guestNumber') int guestNumber,
      @JsonKey(name: 'transactionType') String? transactionType,
      @JsonKey(name: 'subTotal') int subTotal,
      @JsonKey(name: 'discountTotal') int discountTotal,
      @ListMapConverter() List<Map<String, dynamic>> discountOnDetail,
      @ListMapConverter() List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'grandTotalBeforeTax') int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'ppnName') String? ppnName,
      @JsonKey(name: 'serviceCharge') int serviceCharge,
      @JsonKey(name: 'packageNService') int packageNService,
      @JsonKey(name: 'grandTotalAfterTax') int grandTotalAfterTax,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'grandTotalFinal') int grandTotalFinal,
      @JsonKey(name: 'posLoginID') int posLoginID,
      @JsonKey(name: 'closeBillStaffID') int closeBillStaffID,
      @JsonKey(name: 'paymentMethod') String? paymentMethod,
      @JsonKey(name: 'statusTransaction') String? statusTransaction,
      @JsonKey(name: 'statusSync') int statusSync,
      @JsonKey(name: 'statusReceipt') int statusReceipt});
}

/// @nodoc
class __$$TransactionLiteModelImplCopyWithImpl<$Res>
    extends _$TransactionLiteModelCopyWithImpl<$Res, _$TransactionLiteModelImpl>
    implements _$$TransactionLiteModelImplCopyWith<$Res> {
  __$$TransactionLiteModelImplCopyWithImpl(_$TransactionLiteModelImpl _value,
      $Res Function(_$TransactionLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = null,
    Object? transactionNumber = freezed,
    Object? datetime = freezed,
    Object? outletName = freezed,
    Object? customerID = null,
    Object? customerCode = freezed,
    Object? customerName = freezed,
    Object? tableID = null,
    Object? tableLabel = freezed,
    Object? guestNumber = null,
    Object? transactionType = freezed,
    Object? subTotal = null,
    Object? discountTotal = null,
    Object? discountOnDetail = null,
    Object? discountOnTrans = null,
    Object? grandTotalBeforeTax = null,
    Object? ppn = null,
    Object? ppnName = freezed,
    Object? serviceCharge = null,
    Object? packageNService = null,
    Object? grandTotalAfterTax = null,
    Object? rounding = null,
    Object? grandTotalFinal = null,
    Object? posLoginID = null,
    Object? closeBillStaffID = null,
    Object? paymentMethod = freezed,
    Object? statusTransaction = freezed,
    Object? statusSync = null,
    Object? statusReceipt = null,
  }) {
    return _then(_$TransactionLiteModelImpl(
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountOnDetail: null == discountOnDetail
          ? _value._discountOnDetail
          : discountOnDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountOnTrans: null == discountOnTrans
          ? _value._discountOnTrans
          : discountOnTrans // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      grandTotalBeforeTax: null == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
      ppnName: freezed == ppnName
          ? _value.ppnName
          : ppnName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCharge: null == serviceCharge
          ? _value.serviceCharge
          : serviceCharge // ignore: cast_nullable_to_non_nullable
              as int,
      packageNService: null == packageNService
          ? _value.packageNService
          : packageNService // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotalAfterTax: null == grandTotalAfterTax
          ? _value.grandTotalAfterTax
          : grandTotalAfterTax // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotalFinal: null == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int,
      posLoginID: null == posLoginID
          ? _value.posLoginID
          : posLoginID // ignore: cast_nullable_to_non_nullable
              as int,
      closeBillStaffID: null == closeBillStaffID
          ? _value.closeBillStaffID
          : closeBillStaffID // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTransaction: freezed == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      statusSync: null == statusSync
          ? _value.statusSync
          : statusSync // ignore: cast_nullable_to_non_nullable
              as int,
      statusReceipt: null == statusReceipt
          ? _value.statusReceipt
          : statusReceipt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionLiteModelImpl implements _TransactionLiteModel {
  const _$TransactionLiteModelImpl(
      {@JsonKey(name: 'transactionID') required this.transactionID,
      @JsonKey(name: 'transactionNumber') this.transactionNumber,
      @JsonKey(name: 'datetime') this.datetime,
      @JsonKey(name: 'outletName') this.outletName,
      @JsonKey(name: 'customerID') required this.customerID,
      @JsonKey(name: 'customerCode') this.customerCode,
      @JsonKey(name: 'customerName') this.customerName,
      @JsonKey(name: 'tableID') required this.tableID,
      @JsonKey(name: 'tableLabel') this.tableLabel,
      @JsonKey(name: 'guestNumber') required this.guestNumber,
      @JsonKey(name: 'transactionType') this.transactionType,
      @JsonKey(name: 'subTotal') required this.subTotal,
      @JsonKey(name: 'discountTotal') required this.discountTotal,
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnDetail,
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'grandTotalBeforeTax') required this.grandTotalBeforeTax,
      @JsonKey(name: 'ppn') required this.ppn,
      @JsonKey(name: 'ppnName') required this.ppnName,
      @JsonKey(name: 'serviceCharge') required this.serviceCharge,
      @JsonKey(name: 'packageNService') required this.packageNService,
      @JsonKey(name: 'grandTotalAfterTax') required this.grandTotalAfterTax,
      @JsonKey(name: 'rounding') required this.rounding,
      @JsonKey(name: 'grandTotalFinal') required this.grandTotalFinal,
      @JsonKey(name: 'posLoginID') required this.posLoginID,
      @JsonKey(name: 'closeBillStaffID') required this.closeBillStaffID,
      @JsonKey(name: 'paymentMethod') this.paymentMethod,
      @JsonKey(name: 'statusTransaction') this.statusTransaction,
      @JsonKey(name: 'statusSync') required this.statusSync,
      @JsonKey(name: 'statusReceipt') required this.statusReceipt})
      : _discountOnDetail = discountOnDetail,
        _discountOnTrans = discountOnTrans;

  factory _$TransactionLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'transactionID')
  final int transactionID;
  @override
  @JsonKey(name: 'transactionNumber')
  final String? transactionNumber;
  @override
  @JsonKey(name: 'datetime')
  final String? datetime;
  @override
  @JsonKey(name: 'outletName')
  final String? outletName;
  @override
  @JsonKey(name: 'customerID')
  final int customerID;
  @override
  @JsonKey(name: 'customerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'customerName')
  final String? customerName;
  @override
  @JsonKey(name: 'tableID')
  final int tableID;
  @override
  @JsonKey(name: 'tableLabel')
  final String? tableLabel;
  @override
  @JsonKey(name: 'guestNumber')
  final int guestNumber;
  @override
  @JsonKey(name: 'transactionType')
  final String? transactionType;
  @override
  @JsonKey(name: 'subTotal')
  final int subTotal;
  @override
  @JsonKey(name: 'discountTotal')
  final int discountTotal;
  final List<Map<String, dynamic>> _discountOnDetail;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail {
    if (_discountOnDetail is EqualUnmodifiableListView)
      return _discountOnDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountOnDetail);
  }

  final List<Map<String, dynamic>> _discountOnTrans;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans {
    if (_discountOnTrans is EqualUnmodifiableListView) return _discountOnTrans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountOnTrans);
  }

  @override
  @JsonKey(name: 'grandTotalBeforeTax')
  final int grandTotalBeforeTax;
  @override
  @JsonKey(name: 'ppn')
  final int ppn;
  @override
  @JsonKey(name: 'ppnName')
  final String? ppnName;
  @override
  @JsonKey(name: 'serviceCharge')
  final int serviceCharge;
  @override
  @JsonKey(name: 'packageNService')
  final int packageNService;
  @override
  @JsonKey(name: 'grandTotalAfterTax')
  final int grandTotalAfterTax;
  @override
  @JsonKey(name: 'rounding')
  final int rounding;
  @override
  @JsonKey(name: 'grandTotalFinal')
  final int grandTotalFinal;
  @override
  @JsonKey(name: 'posLoginID')
  final int posLoginID;
  @override
  @JsonKey(name: 'closeBillStaffID')
  final int closeBillStaffID;
  @override
  @JsonKey(name: 'paymentMethod')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'statusTransaction')
  final String? statusTransaction;
  @override
  @JsonKey(name: 'statusSync')
  final int statusSync;
  @override
  @JsonKey(name: 'statusReceipt')
  final int statusReceipt;

  @override
  String toString() {
    return 'TransactionLiteModel(transactionID: $transactionID, transactionNumber: $transactionNumber, datetime: $datetime, outletName: $outletName, customerID: $customerID, customerCode: $customerCode, customerName: $customerName, tableID: $tableID, tableLabel: $tableLabel, guestNumber: $guestNumber, transactionType: $transactionType, subTotal: $subTotal, discountTotal: $discountTotal, discountOnDetail: $discountOnDetail, discountOnTrans: $discountOnTrans, grandTotalBeforeTax: $grandTotalBeforeTax, ppn: $ppn, ppnName: $ppnName, serviceCharge: $serviceCharge, packageNService: $packageNService, grandTotalAfterTax: $grandTotalAfterTax, rounding: $rounding, grandTotalFinal: $grandTotalFinal, posLoginID: $posLoginID, closeBillStaffID: $closeBillStaffID, paymentMethod: $paymentMethod, statusTransaction: $statusTransaction, statusSync: $statusSync, statusReceipt: $statusReceipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLiteModelImpl &&
            (identical(other.transactionID, transactionID) ||
                other.transactionID == transactionID) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.guestNumber, guestNumber) ||
                other.guestNumber == guestNumber) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            const DeepCollectionEquality()
                .equals(other._discountOnDetail, _discountOnDetail) &&
            const DeepCollectionEquality()
                .equals(other._discountOnTrans, _discountOnTrans) &&
            (identical(other.grandTotalBeforeTax, grandTotalBeforeTax) ||
                other.grandTotalBeforeTax == grandTotalBeforeTax) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.ppnName, ppnName) || other.ppnName == ppnName) &&
            (identical(other.serviceCharge, serviceCharge) ||
                other.serviceCharge == serviceCharge) &&
            (identical(other.packageNService, packageNService) ||
                other.packageNService == packageNService) &&
            (identical(other.grandTotalAfterTax, grandTotalAfterTax) ||
                other.grandTotalAfterTax == grandTotalAfterTax) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.grandTotalFinal, grandTotalFinal) ||
                other.grandTotalFinal == grandTotalFinal) &&
            (identical(other.posLoginID, posLoginID) ||
                other.posLoginID == posLoginID) &&
            (identical(other.closeBillStaffID, closeBillStaffID) ||
                other.closeBillStaffID == closeBillStaffID) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.statusTransaction, statusTransaction) ||
                other.statusTransaction == statusTransaction) &&
            (identical(other.statusSync, statusSync) ||
                other.statusSync == statusSync) &&
            (identical(other.statusReceipt, statusReceipt) ||
                other.statusReceipt == statusReceipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionID,
        transactionNumber,
        datetime,
        outletName,
        customerID,
        customerCode,
        customerName,
        tableID,
        tableLabel,
        guestNumber,
        transactionType,
        subTotal,
        discountTotal,
        const DeepCollectionEquality().hash(_discountOnDetail),
        const DeepCollectionEquality().hash(_discountOnTrans),
        grandTotalBeforeTax,
        ppn,
        ppnName,
        serviceCharge,
        packageNService,
        grandTotalAfterTax,
        rounding,
        grandTotalFinal,
        posLoginID,
        closeBillStaffID,
        paymentMethod,
        statusTransaction,
        statusSync,
        statusReceipt
      ]);

  /// Create a copy of TransactionLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLiteModelImplCopyWith<_$TransactionLiteModelImpl>
      get copyWith =>
          __$$TransactionLiteModelImplCopyWithImpl<_$TransactionLiteModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionLiteModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionLiteModel implements TransactionLiteModel {
  const factory _TransactionLiteModel(
      {@JsonKey(name: 'transactionID') required final int transactionID,
      @JsonKey(name: 'transactionNumber') final String? transactionNumber,
      @JsonKey(name: 'datetime') final String? datetime,
      @JsonKey(name: 'outletName') final String? outletName,
      @JsonKey(name: 'customerID') required final int customerID,
      @JsonKey(name: 'customerCode') final String? customerCode,
      @JsonKey(name: 'customerName') final String? customerName,
      @JsonKey(name: 'tableID') required final int tableID,
      @JsonKey(name: 'tableLabel') final String? tableLabel,
      @JsonKey(name: 'guestNumber') required final int guestNumber,
      @JsonKey(name: 'transactionType') final String? transactionType,
      @JsonKey(name: 'subTotal') required final int subTotal,
      @JsonKey(name: 'discountTotal') required final int discountTotal,
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnDetail,
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'grandTotalBeforeTax')
      required final int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') required final int ppn,
      @JsonKey(name: 'ppnName') required final String? ppnName,
      @JsonKey(name: 'serviceCharge') required final int serviceCharge,
      @JsonKey(name: 'packageNService') required final int packageNService,
      @JsonKey(name: 'grandTotalAfterTax')
      required final int grandTotalAfterTax,
      @JsonKey(name: 'rounding') required final int rounding,
      @JsonKey(name: 'grandTotalFinal') required final int grandTotalFinal,
      @JsonKey(name: 'posLoginID') required final int posLoginID,
      @JsonKey(name: 'closeBillStaffID') required final int closeBillStaffID,
      @JsonKey(name: 'paymentMethod') final String? paymentMethod,
      @JsonKey(name: 'statusTransaction') final String? statusTransaction,
      @JsonKey(name: 'statusSync') required final int statusSync,
      @JsonKey(name: 'statusReceipt')
      required final int statusReceipt}) = _$TransactionLiteModelImpl;

  factory _TransactionLiteModel.fromJson(Map<String, dynamic> json) =
      _$TransactionLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'transactionID')
  int get transactionID;
  @override
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber;
  @override
  @JsonKey(name: 'datetime')
  String? get datetime;
  @override
  @JsonKey(name: 'outletName')
  String? get outletName;
  @override
  @JsonKey(name: 'customerID')
  int get customerID;
  @override
  @JsonKey(name: 'customerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'customerName')
  String? get customerName;
  @override
  @JsonKey(name: 'tableID')
  int get tableID;
  @override
  @JsonKey(name: 'tableLabel')
  String? get tableLabel;
  @override
  @JsonKey(name: 'guestNumber')
  int get guestNumber;
  @override
  @JsonKey(name: 'transactionType')
  String? get transactionType;
  @override
  @JsonKey(name: 'subTotal')
  int get subTotal;
  @override
  @JsonKey(name: 'discountTotal')
  int get discountTotal;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans;
  @override
  @JsonKey(name: 'grandTotalBeforeTax')
  int get grandTotalBeforeTax;
  @override
  @JsonKey(name: 'ppn')
  int get ppn;
  @override
  @JsonKey(name: 'ppnName')
  String? get ppnName;
  @override
  @JsonKey(name: 'serviceCharge')
  int get serviceCharge;
  @override
  @JsonKey(name: 'packageNService')
  int get packageNService;
  @override
  @JsonKey(name: 'grandTotalAfterTax')
  int get grandTotalAfterTax;
  @override
  @JsonKey(name: 'rounding')
  int get rounding;
  @override
  @JsonKey(name: 'grandTotalFinal')
  int get grandTotalFinal;
  @override
  @JsonKey(name: 'posLoginID')
  int get posLoginID;
  @override
  @JsonKey(name: 'closeBillStaffID')
  int get closeBillStaffID;
  @override
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'statusTransaction')
  String? get statusTransaction;
  @override
  @JsonKey(name: 'statusSync')
  int get statusSync;
  @override
  @JsonKey(name: 'statusReceipt')
  int get statusReceipt;

  /// Create a copy of TransactionLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionLiteModelImplCopyWith<_$TransactionLiteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
