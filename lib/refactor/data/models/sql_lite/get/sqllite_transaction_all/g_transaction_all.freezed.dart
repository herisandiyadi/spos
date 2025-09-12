// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_transaction_all.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionLiteAllModel _$TransactionLiteAllModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionLiteAllModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionLiteAllModel {
  @JsonKey(name: 'transactionID')
  int get transactionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletName')
  String get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerID')
  int get customerID => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tableID')
  int get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'guestNumber')
  int get guestNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionType')
  String get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionTypeJuncID')
  int get transactionTypeJuncID => throw _privateConstructorUsedError;
  @JsonKey(name: 'subTotal')
  int get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountTotal')
  int get discountTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountOnTrans')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'discountOnDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'grandTotalBeforeTax')
  int get grandTotalBeforeTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn')
  int get ppn => throw _privateConstructorUsedError;
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
  @ListMapConverter()
  List<Map<String, dynamic>> get paymentMethod =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'statusTransaction')
  String get statusTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusSync')
  int get statusSync => throw _privateConstructorUsedError;
  @JsonKey(name: 'appVersion')
  String? get appVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'closeDate')
  String get closeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  List<Detail> get details => throw _privateConstructorUsedError;

  /// Serializes this TransactionLiteAllModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionLiteAllModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionLiteAllModelCopyWith<TransactionLiteAllModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLiteAllModelCopyWith<$Res> {
  factory $TransactionLiteAllModelCopyWith(TransactionLiteAllModel value,
          $Res Function(TransactionLiteAllModel) then) =
      _$TransactionLiteAllModelCopyWithImpl<$Res, TransactionLiteAllModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionID') int transactionID,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'outletName') String outletName,
      @JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String? customerCode,
      @JsonKey(name: 'customerName') String customerName,
      @JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'guestNumber') int guestNumber,
      @JsonKey(name: 'transactionType') String transactionType,
      @JsonKey(name: 'transactionTypeJuncID') int transactionTypeJuncID,
      @JsonKey(name: 'subTotal') int subTotal,
      @JsonKey(name: 'discountTotal') int discountTotal,
      @JsonKey(name: 'discountOnTrans')
      @ListMapConverter()
      List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'discountOnDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountOnDetail,
      @JsonKey(name: 'grandTotalBeforeTax') int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'serviceCharge') int serviceCharge,
      @JsonKey(name: 'packageNService') int packageNService,
      @JsonKey(name: 'grandTotalAfterTax') int grandTotalAfterTax,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'grandTotalFinal') int grandTotalFinal,
      @JsonKey(name: 'posLoginID') int posLoginID,
      @JsonKey(name: 'closeBillStaffID') int closeBillStaffID,
      @JsonKey(name: 'paymentMethod')
      @ListMapConverter()
      List<Map<String, dynamic>> paymentMethod,
      @JsonKey(name: 'statusTransaction') String statusTransaction,
      @JsonKey(name: 'statusSync') int statusSync,
      @JsonKey(name: 'appVersion') String? appVersion,
      @JsonKey(name: 'closeDate') String closeDate,
      @JsonKey(name: 'details') List<Detail> details});
}

/// @nodoc
class _$TransactionLiteAllModelCopyWithImpl<$Res,
        $Val extends TransactionLiteAllModel>
    implements $TransactionLiteAllModelCopyWith<$Res> {
  _$TransactionLiteAllModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionLiteAllModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = null,
    Object? transactionNumber = null,
    Object? datetime = null,
    Object? outletName = null,
    Object? customerID = null,
    Object? customerCode = freezed,
    Object? customerName = null,
    Object? tableID = null,
    Object? guestNumber = null,
    Object? transactionType = null,
    Object? transactionTypeJuncID = null,
    Object? subTotal = null,
    Object? discountTotal = null,
    Object? discountOnTrans = null,
    Object? discountOnDetail = null,
    Object? grandTotalBeforeTax = null,
    Object? ppn = null,
    Object? serviceCharge = null,
    Object? packageNService = null,
    Object? grandTotalAfterTax = null,
    Object? rounding = null,
    Object? grandTotalFinal = null,
    Object? posLoginID = null,
    Object? closeBillStaffID = null,
    Object? paymentMethod = null,
    Object? statusTransaction = null,
    Object? statusSync = null,
    Object? appVersion = freezed,
    Object? closeDate = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      outletName: null == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeJuncID: null == transactionTypeJuncID
          ? _value.transactionTypeJuncID
          : transactionTypeJuncID // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountOnTrans: null == discountOnTrans
          ? _value.discountOnTrans
          : discountOnTrans // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountOnDetail: null == discountOnDetail
          ? _value.discountOnDetail
          : discountOnDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      grandTotalBeforeTax: null == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
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
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      statusTransaction: null == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      statusSync: null == statusSync
          ? _value.statusSync
          : statusSync // ignore: cast_nullable_to_non_nullable
              as int,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: null == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionLiteAllModelImplCopyWith<$Res>
    implements $TransactionLiteAllModelCopyWith<$Res> {
  factory _$$TransactionLiteAllModelImplCopyWith(
          _$TransactionLiteAllModelImpl value,
          $Res Function(_$TransactionLiteAllModelImpl) then) =
      __$$TransactionLiteAllModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionID') int transactionID,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'outletName') String outletName,
      @JsonKey(name: 'customerID') int customerID,
      @JsonKey(name: 'customerCode') String? customerCode,
      @JsonKey(name: 'customerName') String customerName,
      @JsonKey(name: 'tableID') int tableID,
      @JsonKey(name: 'guestNumber') int guestNumber,
      @JsonKey(name: 'transactionType') String transactionType,
      @JsonKey(name: 'transactionTypeJuncID') int transactionTypeJuncID,
      @JsonKey(name: 'subTotal') int subTotal,
      @JsonKey(name: 'discountTotal') int discountTotal,
      @JsonKey(name: 'discountOnTrans')
      @ListMapConverter()
      List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'discountOnDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountOnDetail,
      @JsonKey(name: 'grandTotalBeforeTax') int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'serviceCharge') int serviceCharge,
      @JsonKey(name: 'packageNService') int packageNService,
      @JsonKey(name: 'grandTotalAfterTax') int grandTotalAfterTax,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'grandTotalFinal') int grandTotalFinal,
      @JsonKey(name: 'posLoginID') int posLoginID,
      @JsonKey(name: 'closeBillStaffID') int closeBillStaffID,
      @JsonKey(name: 'paymentMethod')
      @ListMapConverter()
      List<Map<String, dynamic>> paymentMethod,
      @JsonKey(name: 'statusTransaction') String statusTransaction,
      @JsonKey(name: 'statusSync') int statusSync,
      @JsonKey(name: 'appVersion') String? appVersion,
      @JsonKey(name: 'closeDate') String closeDate,
      @JsonKey(name: 'details') List<Detail> details});
}

/// @nodoc
class __$$TransactionLiteAllModelImplCopyWithImpl<$Res>
    extends _$TransactionLiteAllModelCopyWithImpl<$Res,
        _$TransactionLiteAllModelImpl>
    implements _$$TransactionLiteAllModelImplCopyWith<$Res> {
  __$$TransactionLiteAllModelImplCopyWithImpl(
      _$TransactionLiteAllModelImpl _value,
      $Res Function(_$TransactionLiteAllModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionLiteAllModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionID = null,
    Object? transactionNumber = null,
    Object? datetime = null,
    Object? outletName = null,
    Object? customerID = null,
    Object? customerCode = freezed,
    Object? customerName = null,
    Object? tableID = null,
    Object? guestNumber = null,
    Object? transactionType = null,
    Object? transactionTypeJuncID = null,
    Object? subTotal = null,
    Object? discountTotal = null,
    Object? discountOnTrans = null,
    Object? discountOnDetail = null,
    Object? grandTotalBeforeTax = null,
    Object? ppn = null,
    Object? serviceCharge = null,
    Object? packageNService = null,
    Object? grandTotalAfterTax = null,
    Object? rounding = null,
    Object? grandTotalFinal = null,
    Object? posLoginID = null,
    Object? closeBillStaffID = null,
    Object? paymentMethod = null,
    Object? statusTransaction = null,
    Object? statusSync = null,
    Object? appVersion = freezed,
    Object? closeDate = null,
    Object? details = null,
  }) {
    return _then(_$TransactionLiteAllModelImpl(
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      outletName: null == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as int,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      tableID: null == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeJuncID: null == transactionTypeJuncID
          ? _value.transactionTypeJuncID
          : transactionTypeJuncID // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountOnTrans: null == discountOnTrans
          ? _value._discountOnTrans
          : discountOnTrans // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountOnDetail: null == discountOnDetail
          ? _value._discountOnDetail
          : discountOnDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      grandTotalBeforeTax: null == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
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
      paymentMethod: null == paymentMethod
          ? _value._paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      statusTransaction: null == statusTransaction
          ? _value.statusTransaction
          : statusTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      statusSync: null == statusSync
          ? _value.statusSync
          : statusSync // ignore: cast_nullable_to_non_nullable
              as int,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: null == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionLiteAllModelImpl implements _TransactionLiteAllModel {
  const _$TransactionLiteAllModelImpl(
      {@JsonKey(name: 'transactionID') required this.transactionID,
      @JsonKey(name: 'transactionNumber') required this.transactionNumber,
      @JsonKey(name: 'datetime') required this.datetime,
      @JsonKey(name: 'outletName') required this.outletName,
      @JsonKey(name: 'customerID') required this.customerID,
      @JsonKey(name: 'customerCode') this.customerCode,
      @JsonKey(name: 'customerName') required this.customerName,
      @JsonKey(name: 'tableID') required this.tableID,
      @JsonKey(name: 'guestNumber') required this.guestNumber,
      @JsonKey(name: 'transactionType') required this.transactionType,
      @JsonKey(name: 'transactionTypeJuncID')
      required this.transactionTypeJuncID,
      @JsonKey(name: 'subTotal') required this.subTotal,
      @JsonKey(name: 'discountTotal') required this.discountTotal,
      @JsonKey(name: 'discountOnTrans')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'discountOnDetail')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnDetail,
      @JsonKey(name: 'grandTotalBeforeTax') required this.grandTotalBeforeTax,
      @JsonKey(name: 'ppn') required this.ppn,
      @JsonKey(name: 'serviceCharge') required this.serviceCharge,
      @JsonKey(name: 'packageNService') required this.packageNService,
      @JsonKey(name: 'grandTotalAfterTax') required this.grandTotalAfterTax,
      @JsonKey(name: 'rounding') required this.rounding,
      @JsonKey(name: 'grandTotalFinal') required this.grandTotalFinal,
      @JsonKey(name: 'posLoginID') required this.posLoginID,
      @JsonKey(name: 'closeBillStaffID') required this.closeBillStaffID,
      @JsonKey(name: 'paymentMethod')
      @ListMapConverter()
      required final List<Map<String, dynamic>> paymentMethod,
      @JsonKey(name: 'statusTransaction') required this.statusTransaction,
      @JsonKey(name: 'statusSync') required this.statusSync,
      @JsonKey(name: 'appVersion') this.appVersion,
      @JsonKey(name: 'closeDate') required this.closeDate,
      @JsonKey(name: 'details') final List<Detail> details = const []})
      : _discountOnTrans = discountOnTrans,
        _discountOnDetail = discountOnDetail,
        _paymentMethod = paymentMethod,
        _details = details;

  factory _$TransactionLiteAllModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionLiteAllModelImplFromJson(json);

  @override
  @JsonKey(name: 'transactionID')
  final int transactionID;
  @override
  @JsonKey(name: 'transactionNumber')
  final String transactionNumber;
  @override
  @JsonKey(name: 'datetime')
  final String datetime;
  @override
  @JsonKey(name: 'outletName')
  final String outletName;
  @override
  @JsonKey(name: 'customerID')
  final int customerID;
  @override
  @JsonKey(name: 'customerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'customerName')
  final String customerName;
  @override
  @JsonKey(name: 'tableID')
  final int tableID;
  @override
  @JsonKey(name: 'guestNumber')
  final int guestNumber;
  @override
  @JsonKey(name: 'transactionType')
  final String transactionType;
  @override
  @JsonKey(name: 'transactionTypeJuncID')
  final int transactionTypeJuncID;
  @override
  @JsonKey(name: 'subTotal')
  final int subTotal;
  @override
  @JsonKey(name: 'discountTotal')
  final int discountTotal;
  final List<Map<String, dynamic>> _discountOnTrans;
  @override
  @JsonKey(name: 'discountOnTrans')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans {
    if (_discountOnTrans is EqualUnmodifiableListView) return _discountOnTrans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountOnTrans);
  }

  final List<Map<String, dynamic>> _discountOnDetail;
  @override
  @JsonKey(name: 'discountOnDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail {
    if (_discountOnDetail is EqualUnmodifiableListView)
      return _discountOnDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountOnDetail);
  }

  @override
  @JsonKey(name: 'grandTotalBeforeTax')
  final int grandTotalBeforeTax;
  @override
  @JsonKey(name: 'ppn')
  final int ppn;
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
  final List<Map<String, dynamic>> _paymentMethod;
  @override
  @JsonKey(name: 'paymentMethod')
  @ListMapConverter()
  List<Map<String, dynamic>> get paymentMethod {
    if (_paymentMethod is EqualUnmodifiableListView) return _paymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethod);
  }

  @override
  @JsonKey(name: 'statusTransaction')
  final String statusTransaction;
  @override
  @JsonKey(name: 'statusSync')
  final int statusSync;
  @override
  @JsonKey(name: 'appVersion')
  final String? appVersion;
  @override
  @JsonKey(name: 'closeDate')
  final String closeDate;
  final List<Detail> _details;
  @override
  @JsonKey(name: 'details')
  List<Detail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'TransactionLiteAllModel(transactionID: $transactionID, transactionNumber: $transactionNumber, datetime: $datetime, outletName: $outletName, customerID: $customerID, customerCode: $customerCode, customerName: $customerName, tableID: $tableID, guestNumber: $guestNumber, transactionType: $transactionType, transactionTypeJuncID: $transactionTypeJuncID, subTotal: $subTotal, discountTotal: $discountTotal, discountOnTrans: $discountOnTrans, discountOnDetail: $discountOnDetail, grandTotalBeforeTax: $grandTotalBeforeTax, ppn: $ppn, serviceCharge: $serviceCharge, packageNService: $packageNService, grandTotalAfterTax: $grandTotalAfterTax, rounding: $rounding, grandTotalFinal: $grandTotalFinal, posLoginID: $posLoginID, closeBillStaffID: $closeBillStaffID, paymentMethod: $paymentMethod, statusTransaction: $statusTransaction, statusSync: $statusSync, appVersion: $appVersion, closeDate: $closeDate, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLiteAllModelImpl &&
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
            (identical(other.guestNumber, guestNumber) ||
                other.guestNumber == guestNumber) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionTypeJuncID, transactionTypeJuncID) ||
                other.transactionTypeJuncID == transactionTypeJuncID) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            const DeepCollectionEquality()
                .equals(other._discountOnTrans, _discountOnTrans) &&
            const DeepCollectionEquality()
                .equals(other._discountOnDetail, _discountOnDetail) &&
            (identical(other.grandTotalBeforeTax, grandTotalBeforeTax) ||
                other.grandTotalBeforeTax == grandTotalBeforeTax) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
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
            const DeepCollectionEquality()
                .equals(other._paymentMethod, _paymentMethod) &&
            (identical(other.statusTransaction, statusTransaction) ||
                other.statusTransaction == statusTransaction) &&
            (identical(other.statusSync, statusSync) ||
                other.statusSync == statusSync) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            const DeepCollectionEquality().equals(other._details, _details));
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
        guestNumber,
        transactionType,
        transactionTypeJuncID,
        subTotal,
        discountTotal,
        const DeepCollectionEquality().hash(_discountOnTrans),
        const DeepCollectionEquality().hash(_discountOnDetail),
        grandTotalBeforeTax,
        ppn,
        serviceCharge,
        packageNService,
        grandTotalAfterTax,
        rounding,
        grandTotalFinal,
        posLoginID,
        closeBillStaffID,
        const DeepCollectionEquality().hash(_paymentMethod),
        statusTransaction,
        statusSync,
        appVersion,
        closeDate,
        const DeepCollectionEquality().hash(_details)
      ]);

  /// Create a copy of TransactionLiteAllModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLiteAllModelImplCopyWith<_$TransactionLiteAllModelImpl>
      get copyWith => __$$TransactionLiteAllModelImplCopyWithImpl<
          _$TransactionLiteAllModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionLiteAllModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionLiteAllModel implements TransactionLiteAllModel {
  const factory _TransactionLiteAllModel(
      {@JsonKey(name: 'transactionID') required final int transactionID,
      @JsonKey(name: 'transactionNumber')
      required final String transactionNumber,
      @JsonKey(name: 'datetime') required final String datetime,
      @JsonKey(name: 'outletName') required final String outletName,
      @JsonKey(name: 'customerID') required final int customerID,
      @JsonKey(name: 'customerCode') final String? customerCode,
      @JsonKey(name: 'customerName') required final String customerName,
      @JsonKey(name: 'tableID') required final int tableID,
      @JsonKey(name: 'guestNumber') required final int guestNumber,
      @JsonKey(name: 'transactionType') required final String transactionType,
      @JsonKey(name: 'transactionTypeJuncID')
      required final int transactionTypeJuncID,
      @JsonKey(name: 'subTotal') required final int subTotal,
      @JsonKey(name: 'discountTotal') required final int discountTotal,
      @JsonKey(name: 'discountOnTrans')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnTrans,
      @JsonKey(name: 'discountOnDetail')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountOnDetail,
      @JsonKey(name: 'grandTotalBeforeTax')
      required final int grandTotalBeforeTax,
      @JsonKey(name: 'ppn') required final int ppn,
      @JsonKey(name: 'serviceCharge') required final int serviceCharge,
      @JsonKey(name: 'packageNService') required final int packageNService,
      @JsonKey(name: 'grandTotalAfterTax')
      required final int grandTotalAfterTax,
      @JsonKey(name: 'rounding') required final int rounding,
      @JsonKey(name: 'grandTotalFinal') required final int grandTotalFinal,
      @JsonKey(name: 'posLoginID') required final int posLoginID,
      @JsonKey(name: 'closeBillStaffID') required final int closeBillStaffID,
      @JsonKey(name: 'paymentMethod')
      @ListMapConverter()
      required final List<Map<String, dynamic>> paymentMethod,
      @JsonKey(name: 'statusTransaction')
      required final String statusTransaction,
      @JsonKey(name: 'statusSync') required final int statusSync,
      @JsonKey(name: 'appVersion') final String? appVersion,
      @JsonKey(name: 'closeDate') required final String closeDate,
      @JsonKey(name: 'details')
      final List<Detail> details}) = _$TransactionLiteAllModelImpl;

  factory _TransactionLiteAllModel.fromJson(Map<String, dynamic> json) =
      _$TransactionLiteAllModelImpl.fromJson;

  @override
  @JsonKey(name: 'transactionID')
  int get transactionID;
  @override
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber;
  @override
  @JsonKey(name: 'datetime')
  String get datetime;
  @override
  @JsonKey(name: 'outletName')
  String get outletName;
  @override
  @JsonKey(name: 'customerID')
  int get customerID;
  @override
  @JsonKey(name: 'customerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'customerName')
  String get customerName;
  @override
  @JsonKey(name: 'tableID')
  int get tableID;
  @override
  @JsonKey(name: 'guestNumber')
  int get guestNumber;
  @override
  @JsonKey(name: 'transactionType')
  String get transactionType;
  @override
  @JsonKey(name: 'transactionTypeJuncID')
  int get transactionTypeJuncID;
  @override
  @JsonKey(name: 'subTotal')
  int get subTotal;
  @override
  @JsonKey(name: 'discountTotal')
  int get discountTotal;
  @override
  @JsonKey(name: 'discountOnTrans')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnTrans;
  @override
  @JsonKey(name: 'discountOnDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountOnDetail;
  @override
  @JsonKey(name: 'grandTotalBeforeTax')
  int get grandTotalBeforeTax;
  @override
  @JsonKey(name: 'ppn')
  int get ppn;
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
  @ListMapConverter()
  List<Map<String, dynamic>> get paymentMethod;
  @override
  @JsonKey(name: 'statusTransaction')
  String get statusTransaction;
  @override
  @JsonKey(name: 'statusSync')
  int get statusSync;
  @override
  @JsonKey(name: 'appVersion')
  String? get appVersion;
  @override
  @JsonKey(name: 'closeDate')
  String get closeDate;
  @override
  @JsonKey(name: 'details')
  List<Detail> get details;

  /// Create a copy of TransactionLiteAllModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionLiteAllModelImplCopyWith<_$TransactionLiteAllModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  @JsonKey(name: 'transactionDetailID')
  int? get transactionDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuID')
  int? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPrice')
  int? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn')
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPriceAfterDiscount')
  int? get menuPriceAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'noteOption')
  String? get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID')
  int? get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusSend')
  int? get statusSend => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  int? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusItem')
  String? get statusItem => throw _privateConstructorUsedError;

  /// Serializes this Detail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int? transactionDetailID,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'menuID') int? menuID,
      @JsonKey(name: 'menuName') String? menuName,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'menuPrice') int? menuPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      List<Map<String, dynamic>> addOn,
      @JsonKey(name: 'menuPriceAfterDiscount') int? menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String? noteOption,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String? menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'statusItem') String? statusItem});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = freezed,
    Object? transactionNumber = freezed,
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? discountDetail = null,
    Object? addOn = null,
    Object? menuPriceAfterDiscount = freezed,
    Object? noteOption = freezed,
    Object? parentID = freezed,
    Object? menuImage = freezed,
    Object? statusSend = freezed,
    Object? notes = freezed,
    Object? stationID = freezed,
    Object? statusItem = freezed,
  }) {
    return _then(_value.copyWith(
      transactionDetailID: freezed == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
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
              as List<Map<String, dynamic>>,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      menuPriceAfterDiscount: freezed == menuPriceAfterDiscount
          ? _value.menuPriceAfterDiscount
          : menuPriceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      noteOption: freezed == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      statusSend: freezed == statusSend
          ? _value.statusSend
          : statusSend // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      statusItem: freezed == statusItem
          ? _value.statusItem
          : statusItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int? transactionDetailID,
      @JsonKey(name: 'transactionNumber') String? transactionNumber,
      @JsonKey(name: 'menuID') int? menuID,
      @JsonKey(name: 'menuName') String? menuName,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'menuPrice') int? menuPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      List<Map<String, dynamic>> addOn,
      @JsonKey(name: 'menuPriceAfterDiscount') int? menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String? noteOption,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String? menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'statusItem') String? statusItem});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = freezed,
    Object? transactionNumber = freezed,
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? qty = freezed,
    Object? menuPrice = freezed,
    Object? discountDetail = null,
    Object? addOn = null,
    Object? menuPriceAfterDiscount = freezed,
    Object? noteOption = freezed,
    Object? parentID = freezed,
    Object? menuImage = freezed,
    Object? statusSend = freezed,
    Object? notes = freezed,
    Object? stationID = freezed,
    Object? statusItem = freezed,
  }) {
    return _then(_$DetailImpl(
      transactionDetailID: freezed == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNumber: freezed == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
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
              as List<Map<String, dynamic>>,
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      menuPriceAfterDiscount: freezed == menuPriceAfterDiscount
          ? _value.menuPriceAfterDiscount
          : menuPriceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      noteOption: freezed == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      statusSend: freezed == statusSend
          ? _value.statusSend
          : statusSend // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      statusItem: freezed == statusItem
          ? _value.statusItem
          : statusItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl implements _Detail {
  const _$DetailImpl(
      {@JsonKey(name: 'transactionDetailID') this.transactionDetailID,
      @JsonKey(name: 'transactionNumber') this.transactionNumber,
      @JsonKey(name: 'menuID') this.menuID,
      @JsonKey(name: 'menuName') this.menuName,
      @JsonKey(name: 'qty') this.qty,
      @JsonKey(name: 'menuPrice') this.menuPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      required final List<Map<String, dynamic>> addOn,
      @JsonKey(name: 'menuPriceAfterDiscount') this.menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') this.noteOption,
      @JsonKey(name: 'parentID') this.parentID,
      @JsonKey(name: 'menuImage') this.menuImage,
      @JsonKey(name: 'statusSend') this.statusSend,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'stationID') this.stationID,
      @JsonKey(name: 'statusItem') this.statusItem})
      : _discountDetail = discountDetail,
        _addOn = addOn;

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  @JsonKey(name: 'transactionDetailID')
  final int? transactionDetailID;
  @override
  @JsonKey(name: 'transactionNumber')
  final String? transactionNumber;
  @override
  @JsonKey(name: 'menuID')
  final int? menuID;
  @override
  @JsonKey(name: 'menuName')
  final String? menuName;
  @override
  @JsonKey(name: 'qty')
  final int? qty;
  @override
  @JsonKey(name: 'menuPrice')
  final int? menuPrice;
  final List<Map<String, dynamic>> _discountDetail;
  @override
  @JsonKey(name: 'discountDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail {
    if (_discountDetail is EqualUnmodifiableListView) return _discountDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountDetail);
  }

  final List<Map<String, dynamic>> _addOn;
  @override
  @JsonKey(name: 'addOn')
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn {
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOn);
  }

  @override
  @JsonKey(name: 'menuPriceAfterDiscount')
  final int? menuPriceAfterDiscount;
  @override
  @JsonKey(name: 'noteOption')
  final String? noteOption;
  @override
  @JsonKey(name: 'parentID')
  final int? parentID;
  @override
  @JsonKey(name: 'menuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'statusSend')
  final int? statusSend;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  @override
  @JsonKey(name: 'stationID')
  final int? stationID;
  @override
  @JsonKey(name: 'statusItem')
  final String? statusItem;

  @override
  String toString() {
    return 'Detail(transactionDetailID: $transactionDetailID, transactionNumber: $transactionNumber, menuID: $menuID, menuName: $menuName, qty: $qty, menuPrice: $menuPrice, discountDetail: $discountDetail, addOn: $addOn, menuPriceAfterDiscount: $menuPriceAfterDiscount, noteOption: $noteOption, parentID: $parentID, menuImage: $menuImage, statusSend: $statusSend, notes: $notes, stationID: $stationID, statusItem: $statusItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.transactionDetailID, transactionDetailID) ||
                other.transactionDetailID == transactionDetailID) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            const DeepCollectionEquality()
                .equals(other._discountDetail, _discountDetail) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn) &&
            (identical(other.menuPriceAfterDiscount, menuPriceAfterDiscount) ||
                other.menuPriceAfterDiscount == menuPriceAfterDiscount) &&
            (identical(other.noteOption, noteOption) ||
                other.noteOption == noteOption) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.statusSend, statusSend) ||
                other.statusSend == statusSend) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.statusItem, statusItem) ||
                other.statusItem == statusItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDetailID,
      transactionNumber,
      menuID,
      menuName,
      qty,
      menuPrice,
      const DeepCollectionEquality().hash(_discountDetail),
      const DeepCollectionEquality().hash(_addOn),
      menuPriceAfterDiscount,
      noteOption,
      parentID,
      menuImage,
      statusSend,
      notes,
      stationID,
      statusItem);

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  const factory _Detail(
      {@JsonKey(name: 'transactionDetailID') final int? transactionDetailID,
      @JsonKey(name: 'transactionNumber') final String? transactionNumber,
      @JsonKey(name: 'menuID') final int? menuID,
      @JsonKey(name: 'menuName') final String? menuName,
      @JsonKey(name: 'qty') final int? qty,
      @JsonKey(name: 'menuPrice') final int? menuPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      required final List<Map<String, dynamic>> addOn,
      @JsonKey(name: 'menuPriceAfterDiscount')
      final int? menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') final String? noteOption,
      @JsonKey(name: 'parentID') final int? parentID,
      @JsonKey(name: 'menuImage') final String? menuImage,
      @JsonKey(name: 'statusSend') final int? statusSend,
      @JsonKey(name: 'notes') final String? notes,
      @JsonKey(name: 'stationID') final int? stationID,
      @JsonKey(name: 'statusItem') final String? statusItem}) = _$DetailImpl;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  @JsonKey(name: 'transactionDetailID')
  int? get transactionDetailID;
  @override
  @JsonKey(name: 'transactionNumber')
  String? get transactionNumber;
  @override
  @JsonKey(name: 'menuID')
  int? get menuID;
  @override
  @JsonKey(name: 'menuName')
  String? get menuName;
  @override
  @JsonKey(name: 'qty')
  int? get qty;
  @override
  @JsonKey(name: 'menuPrice')
  int? get menuPrice;
  @override
  @JsonKey(name: 'discountDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail;
  @override
  @JsonKey(name: 'addOn')
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn;
  @override
  @JsonKey(name: 'menuPriceAfterDiscount')
  int? get menuPriceAfterDiscount;
  @override
  @JsonKey(name: 'noteOption')
  String? get noteOption;
  @override
  @JsonKey(name: 'parentID')
  int? get parentID;
  @override
  @JsonKey(name: 'menuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'statusSend')
  int? get statusSend;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'stationID')
  int? get stationID;
  @override
  @JsonKey(name: 'statusItem')
  String? get statusItem;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
