// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_transaction_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionReportModel _$TransactionReportModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionReportModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionReportModel {
  @JsonKey(name: 'discount_total')
  int? get discountTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total_before_tax')
  int? get grandTotalBeforeTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total_after_tax')
  int? get grandTotalAfterTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_rounding')
  int? get totalRounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total_final')
  int? get grandTotalFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transaction_close')
  int? get totalTransactionClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_payment_method')
  int? get totalPaymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_spent_per_transaction')
  int? get averageSpentTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_grand_total_final')
  double? get percentageGrandTotalFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_avg')
  double? get percentageAVG => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_total_transaction')
  double? get percentageTotalTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_total_discount')
  double? get percentageTotalDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  List<PaymentMethod> get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'detatilTrans')
  List<Product> get detatilTrans => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total_tax')
  int? get grand_total_tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total_tax1')
  int? get grand_total_tax1 => throw _privateConstructorUsedError;

  /// Serializes this TransactionReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionReportModelCopyWith<TransactionReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionReportModelCopyWith<$Res> {
  factory $TransactionReportModelCopyWith(TransactionReportModel value,
          $Res Function(TransactionReportModel) then) =
      _$TransactionReportModelCopyWithImpl<$Res, TransactionReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'discount_total') int? discountTotal,
      @JsonKey(name: 'grand_total_before_tax') int? grandTotalBeforeTax,
      @JsonKey(name: 'grand_total_after_tax') int? grandTotalAfterTax,
      @JsonKey(name: 'total_rounding') int? totalRounding,
      @JsonKey(name: 'grand_total_final') int? grandTotalFinal,
      @JsonKey(name: 'total_transaction_close') int? totalTransactionClose,
      @JsonKey(name: 'total_payment_method') int? totalPaymentMethod,
      @JsonKey(name: 'average_spent_per_transaction')
      int? averageSpentTransaction,
      @JsonKey(name: 'percentage_grand_total_final')
      double? percentageGrandTotalFinal,
      @JsonKey(name: 'percentage_avg') double? percentageAVG,
      @JsonKey(name: 'percentage_total_transaction')
      double? percentageTotalTransaction,
      @JsonKey(name: 'percentage_total_discount')
      double? percentageTotalDiscount,
      @JsonKey(name: 'payment_method') List<PaymentMethod> paymentMethod,
      @JsonKey(name: 'detatilTrans') List<Product> detatilTrans,
      @JsonKey(name: 'grand_total_tax') int? grand_total_tax,
      @JsonKey(name: 'grand_total_tax1') int? grand_total_tax1});
}

/// @nodoc
class _$TransactionReportModelCopyWithImpl<$Res,
        $Val extends TransactionReportModel>
    implements $TransactionReportModelCopyWith<$Res> {
  _$TransactionReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountTotal = freezed,
    Object? grandTotalBeforeTax = freezed,
    Object? grandTotalAfterTax = freezed,
    Object? totalRounding = freezed,
    Object? grandTotalFinal = freezed,
    Object? totalTransactionClose = freezed,
    Object? totalPaymentMethod = freezed,
    Object? averageSpentTransaction = freezed,
    Object? percentageGrandTotalFinal = freezed,
    Object? percentageAVG = freezed,
    Object? percentageTotalTransaction = freezed,
    Object? percentageTotalDiscount = freezed,
    Object? paymentMethod = null,
    Object? detatilTrans = null,
    Object? grand_total_tax = freezed,
    Object? grand_total_tax1 = freezed,
  }) {
    return _then(_value.copyWith(
      discountTotal: freezed == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalBeforeTax: freezed == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalAfterTax: freezed == grandTotalAfterTax
          ? _value.grandTotalAfterTax
          : grandTotalAfterTax // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRounding: freezed == totalRounding
          ? _value.totalRounding
          : totalRounding // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalFinal: freezed == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTransactionClose: freezed == totalTransactionClose
          ? _value.totalTransactionClose
          : totalTransactionClose // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPaymentMethod: freezed == totalPaymentMethod
          ? _value.totalPaymentMethod
          : totalPaymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSpentTransaction: freezed == averageSpentTransaction
          ? _value.averageSpentTransaction
          : averageSpentTransaction // ignore: cast_nullable_to_non_nullable
              as int?,
      percentageGrandTotalFinal: freezed == percentageGrandTotalFinal
          ? _value.percentageGrandTotalFinal
          : percentageGrandTotalFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageAVG: freezed == percentageAVG
          ? _value.percentageAVG
          : percentageAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageTotalTransaction: freezed == percentageTotalTransaction
          ? _value.percentageTotalTransaction
          : percentageTotalTransaction // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageTotalDiscount: freezed == percentageTotalDiscount
          ? _value.percentageTotalDiscount
          : percentageTotalDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      detatilTrans: null == detatilTrans
          ? _value.detatilTrans
          : detatilTrans // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      grand_total_tax: freezed == grand_total_tax
          ? _value.grand_total_tax
          : grand_total_tax // ignore: cast_nullable_to_non_nullable
              as int?,
      grand_total_tax1: freezed == grand_total_tax1
          ? _value.grand_total_tax1
          : grand_total_tax1 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionReportModelImplCopyWith<$Res>
    implements $TransactionReportModelCopyWith<$Res> {
  factory _$$TransactionReportModelImplCopyWith(
          _$TransactionReportModelImpl value,
          $Res Function(_$TransactionReportModelImpl) then) =
      __$$TransactionReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discount_total') int? discountTotal,
      @JsonKey(name: 'grand_total_before_tax') int? grandTotalBeforeTax,
      @JsonKey(name: 'grand_total_after_tax') int? grandTotalAfterTax,
      @JsonKey(name: 'total_rounding') int? totalRounding,
      @JsonKey(name: 'grand_total_final') int? grandTotalFinal,
      @JsonKey(name: 'total_transaction_close') int? totalTransactionClose,
      @JsonKey(name: 'total_payment_method') int? totalPaymentMethod,
      @JsonKey(name: 'average_spent_per_transaction')
      int? averageSpentTransaction,
      @JsonKey(name: 'percentage_grand_total_final')
      double? percentageGrandTotalFinal,
      @JsonKey(name: 'percentage_avg') double? percentageAVG,
      @JsonKey(name: 'percentage_total_transaction')
      double? percentageTotalTransaction,
      @JsonKey(name: 'percentage_total_discount')
      double? percentageTotalDiscount,
      @JsonKey(name: 'payment_method') List<PaymentMethod> paymentMethod,
      @JsonKey(name: 'detatilTrans') List<Product> detatilTrans,
      @JsonKey(name: 'grand_total_tax') int? grand_total_tax,
      @JsonKey(name: 'grand_total_tax1') int? grand_total_tax1});
}

/// @nodoc
class __$$TransactionReportModelImplCopyWithImpl<$Res>
    extends _$TransactionReportModelCopyWithImpl<$Res,
        _$TransactionReportModelImpl>
    implements _$$TransactionReportModelImplCopyWith<$Res> {
  __$$TransactionReportModelImplCopyWithImpl(
      _$TransactionReportModelImpl _value,
      $Res Function(_$TransactionReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountTotal = freezed,
    Object? grandTotalBeforeTax = freezed,
    Object? grandTotalAfterTax = freezed,
    Object? totalRounding = freezed,
    Object? grandTotalFinal = freezed,
    Object? totalTransactionClose = freezed,
    Object? totalPaymentMethod = freezed,
    Object? averageSpentTransaction = freezed,
    Object? percentageGrandTotalFinal = freezed,
    Object? percentageAVG = freezed,
    Object? percentageTotalTransaction = freezed,
    Object? percentageTotalDiscount = freezed,
    Object? paymentMethod = null,
    Object? detatilTrans = null,
    Object? grand_total_tax = freezed,
    Object? grand_total_tax1 = freezed,
  }) {
    return _then(_$TransactionReportModelImpl(
      discountTotal: freezed == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalBeforeTax: freezed == grandTotalBeforeTax
          ? _value.grandTotalBeforeTax
          : grandTotalBeforeTax // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalAfterTax: freezed == grandTotalAfterTax
          ? _value.grandTotalAfterTax
          : grandTotalAfterTax // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRounding: freezed == totalRounding
          ? _value.totalRounding
          : totalRounding // ignore: cast_nullable_to_non_nullable
              as int?,
      grandTotalFinal: freezed == grandTotalFinal
          ? _value.grandTotalFinal
          : grandTotalFinal // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTransactionClose: freezed == totalTransactionClose
          ? _value.totalTransactionClose
          : totalTransactionClose // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPaymentMethod: freezed == totalPaymentMethod
          ? _value.totalPaymentMethod
          : totalPaymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSpentTransaction: freezed == averageSpentTransaction
          ? _value.averageSpentTransaction
          : averageSpentTransaction // ignore: cast_nullable_to_non_nullable
              as int?,
      percentageGrandTotalFinal: freezed == percentageGrandTotalFinal
          ? _value.percentageGrandTotalFinal
          : percentageGrandTotalFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageAVG: freezed == percentageAVG
          ? _value.percentageAVG
          : percentageAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageTotalTransaction: freezed == percentageTotalTransaction
          ? _value.percentageTotalTransaction
          : percentageTotalTransaction // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageTotalDiscount: freezed == percentageTotalDiscount
          ? _value.percentageTotalDiscount
          : percentageTotalDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: null == paymentMethod
          ? _value._paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      detatilTrans: null == detatilTrans
          ? _value._detatilTrans
          : detatilTrans // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      grand_total_tax: freezed == grand_total_tax
          ? _value.grand_total_tax
          : grand_total_tax // ignore: cast_nullable_to_non_nullable
              as int?,
      grand_total_tax1: freezed == grand_total_tax1
          ? _value.grand_total_tax1
          : grand_total_tax1 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionReportModelImpl implements _TransactionReportModel {
  const _$TransactionReportModelImpl(
      {@JsonKey(name: 'discount_total') this.discountTotal,
      @JsonKey(name: 'grand_total_before_tax') this.grandTotalBeforeTax,
      @JsonKey(name: 'grand_total_after_tax') this.grandTotalAfterTax,
      @JsonKey(name: 'total_rounding') this.totalRounding,
      @JsonKey(name: 'grand_total_final') this.grandTotalFinal,
      @JsonKey(name: 'total_transaction_close') this.totalTransactionClose,
      @JsonKey(name: 'total_payment_method') this.totalPaymentMethod,
      @JsonKey(name: 'average_spent_per_transaction')
      this.averageSpentTransaction,
      @JsonKey(name: 'percentage_grand_total_final')
      this.percentageGrandTotalFinal,
      @JsonKey(name: 'percentage_avg') this.percentageAVG,
      @JsonKey(name: 'percentage_total_transaction')
      this.percentageTotalTransaction,
      @JsonKey(name: 'percentage_total_discount') this.percentageTotalDiscount,
      @JsonKey(name: 'payment_method')
      final List<PaymentMethod> paymentMethod = const [],
      @JsonKey(name: 'detatilTrans')
      final List<Product> detatilTrans = const [],
      @JsonKey(name: 'grand_total_tax') this.grand_total_tax,
      @JsonKey(name: 'grand_total_tax1') this.grand_total_tax1})
      : _paymentMethod = paymentMethod,
        _detatilTrans = detatilTrans;

  factory _$TransactionReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionReportModelImplFromJson(json);

  @override
  @JsonKey(name: 'discount_total')
  final int? discountTotal;
  @override
  @JsonKey(name: 'grand_total_before_tax')
  final int? grandTotalBeforeTax;
  @override
  @JsonKey(name: 'grand_total_after_tax')
  final int? grandTotalAfterTax;
  @override
  @JsonKey(name: 'total_rounding')
  final int? totalRounding;
  @override
  @JsonKey(name: 'grand_total_final')
  final int? grandTotalFinal;
  @override
  @JsonKey(name: 'total_transaction_close')
  final int? totalTransactionClose;
  @override
  @JsonKey(name: 'total_payment_method')
  final int? totalPaymentMethod;
  @override
  @JsonKey(name: 'average_spent_per_transaction')
  final int? averageSpentTransaction;
  @override
  @JsonKey(name: 'percentage_grand_total_final')
  final double? percentageGrandTotalFinal;
  @override
  @JsonKey(name: 'percentage_avg')
  final double? percentageAVG;
  @override
  @JsonKey(name: 'percentage_total_transaction')
  final double? percentageTotalTransaction;
  @override
  @JsonKey(name: 'percentage_total_discount')
  final double? percentageTotalDiscount;
  final List<PaymentMethod> _paymentMethod;
  @override
  @JsonKey(name: 'payment_method')
  List<PaymentMethod> get paymentMethod {
    if (_paymentMethod is EqualUnmodifiableListView) return _paymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethod);
  }

  final List<Product> _detatilTrans;
  @override
  @JsonKey(name: 'detatilTrans')
  List<Product> get detatilTrans {
    if (_detatilTrans is EqualUnmodifiableListView) return _detatilTrans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detatilTrans);
  }

  @override
  @JsonKey(name: 'grand_total_tax')
  final int? grand_total_tax;
  @override
  @JsonKey(name: 'grand_total_tax1')
  final int? grand_total_tax1;

  @override
  String toString() {
    return 'TransactionReportModel(discountTotal: $discountTotal, grandTotalBeforeTax: $grandTotalBeforeTax, grandTotalAfterTax: $grandTotalAfterTax, totalRounding: $totalRounding, grandTotalFinal: $grandTotalFinal, totalTransactionClose: $totalTransactionClose, totalPaymentMethod: $totalPaymentMethod, averageSpentTransaction: $averageSpentTransaction, percentageGrandTotalFinal: $percentageGrandTotalFinal, percentageAVG: $percentageAVG, percentageTotalTransaction: $percentageTotalTransaction, percentageTotalDiscount: $percentageTotalDiscount, paymentMethod: $paymentMethod, detatilTrans: $detatilTrans, grand_total_tax: $grand_total_tax, grand_total_tax1: $grand_total_tax1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionReportModelImpl &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            (identical(other.grandTotalBeforeTax, grandTotalBeforeTax) ||
                other.grandTotalBeforeTax == grandTotalBeforeTax) &&
            (identical(other.grandTotalAfterTax, grandTotalAfterTax) ||
                other.grandTotalAfterTax == grandTotalAfterTax) &&
            (identical(other.totalRounding, totalRounding) ||
                other.totalRounding == totalRounding) &&
            (identical(other.grandTotalFinal, grandTotalFinal) ||
                other.grandTotalFinal == grandTotalFinal) &&
            (identical(other.totalTransactionClose, totalTransactionClose) ||
                other.totalTransactionClose == totalTransactionClose) &&
            (identical(other.totalPaymentMethod, totalPaymentMethod) ||
                other.totalPaymentMethod == totalPaymentMethod) &&
            (identical(
                    other.averageSpentTransaction, averageSpentTransaction) ||
                other.averageSpentTransaction == averageSpentTransaction) &&
            (identical(other.percentageGrandTotalFinal,
                    percentageGrandTotalFinal) ||
                other.percentageGrandTotalFinal == percentageGrandTotalFinal) &&
            (identical(other.percentageAVG, percentageAVG) ||
                other.percentageAVG == percentageAVG) &&
            (identical(other.percentageTotalTransaction,
                    percentageTotalTransaction) ||
                other.percentageTotalTransaction ==
                    percentageTotalTransaction) &&
            (identical(
                    other.percentageTotalDiscount, percentageTotalDiscount) ||
                other.percentageTotalDiscount == percentageTotalDiscount) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethod, _paymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._detatilTrans, _detatilTrans) &&
            (identical(other.grand_total_tax, grand_total_tax) ||
                other.grand_total_tax == grand_total_tax) &&
            (identical(other.grand_total_tax1, grand_total_tax1) ||
                other.grand_total_tax1 == grand_total_tax1));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      discountTotal,
      grandTotalBeforeTax,
      grandTotalAfterTax,
      totalRounding,
      grandTotalFinal,
      totalTransactionClose,
      totalPaymentMethod,
      averageSpentTransaction,
      percentageGrandTotalFinal,
      percentageAVG,
      percentageTotalTransaction,
      percentageTotalDiscount,
      const DeepCollectionEquality().hash(_paymentMethod),
      const DeepCollectionEquality().hash(_detatilTrans),
      grand_total_tax,
      grand_total_tax1);

  /// Create a copy of TransactionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionReportModelImplCopyWith<_$TransactionReportModelImpl>
      get copyWith => __$$TransactionReportModelImplCopyWithImpl<
          _$TransactionReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionReportModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionReportModel implements TransactionReportModel {
  const factory _TransactionReportModel(
      {@JsonKey(name: 'discount_total') final int? discountTotal,
      @JsonKey(name: 'grand_total_before_tax') final int? grandTotalBeforeTax,
      @JsonKey(name: 'grand_total_after_tax') final int? grandTotalAfterTax,
      @JsonKey(name: 'total_rounding') final int? totalRounding,
      @JsonKey(name: 'grand_total_final') final int? grandTotalFinal,
      @JsonKey(name: 'total_transaction_close')
      final int? totalTransactionClose,
      @JsonKey(name: 'total_payment_method') final int? totalPaymentMethod,
      @JsonKey(name: 'average_spent_per_transaction')
      final int? averageSpentTransaction,
      @JsonKey(name: 'percentage_grand_total_final')
      final double? percentageGrandTotalFinal,
      @JsonKey(name: 'percentage_avg') final double? percentageAVG,
      @JsonKey(name: 'percentage_total_transaction')
      final double? percentageTotalTransaction,
      @JsonKey(name: 'percentage_total_discount')
      final double? percentageTotalDiscount,
      @JsonKey(name: 'payment_method') final List<PaymentMethod> paymentMethod,
      @JsonKey(name: 'detatilTrans') final List<Product> detatilTrans,
      @JsonKey(name: 'grand_total_tax') final int? grand_total_tax,
      @JsonKey(name: 'grand_total_tax1')
      final int? grand_total_tax1}) = _$TransactionReportModelImpl;

  factory _TransactionReportModel.fromJson(Map<String, dynamic> json) =
      _$TransactionReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'discount_total')
  int? get discountTotal;
  @override
  @JsonKey(name: 'grand_total_before_tax')
  int? get grandTotalBeforeTax;
  @override
  @JsonKey(name: 'grand_total_after_tax')
  int? get grandTotalAfterTax;
  @override
  @JsonKey(name: 'total_rounding')
  int? get totalRounding;
  @override
  @JsonKey(name: 'grand_total_final')
  int? get grandTotalFinal;
  @override
  @JsonKey(name: 'total_transaction_close')
  int? get totalTransactionClose;
  @override
  @JsonKey(name: 'total_payment_method')
  int? get totalPaymentMethod;
  @override
  @JsonKey(name: 'average_spent_per_transaction')
  int? get averageSpentTransaction;
  @override
  @JsonKey(name: 'percentage_grand_total_final')
  double? get percentageGrandTotalFinal;
  @override
  @JsonKey(name: 'percentage_avg')
  double? get percentageAVG;
  @override
  @JsonKey(name: 'percentage_total_transaction')
  double? get percentageTotalTransaction;
  @override
  @JsonKey(name: 'percentage_total_discount')
  double? get percentageTotalDiscount;
  @override
  @JsonKey(name: 'payment_method')
  List<PaymentMethod> get paymentMethod;
  @override
  @JsonKey(name: 'detatilTrans')
  List<Product> get detatilTrans;
  @override
  @JsonKey(name: 'grand_total_tax')
  int? get grand_total_tax;
  @override
  @JsonKey(name: 'grand_total_tax1')
  int? get grand_total_tax1;

  /// Create a copy of TransactionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionReportModelImplCopyWith<_$TransactionReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String? get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  int? get totalAmount => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String? method,
      @JsonKey(name: 'total_amount') int? totalAmount,
      int? total});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? totalAmount = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? method,
      @JsonKey(name: 'total_amount') int? totalAmount,
      int? total});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? totalAmount = freezed,
    Object? total = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {this.method,
      @JsonKey(name: 'total_amount') this.totalAmount,
      this.total});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String? method;
  @override
  @JsonKey(name: 'total_amount')
  final int? totalAmount;
  @override
  final int? total;

  @override
  String toString() {
    return 'PaymentMethod(method: $method, totalAmount: $totalAmount, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, totalAmount, total);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {final String? method,
      @JsonKey(name: 'total_amount') final int? totalAmount,
      final int? total}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String? get method;
  @override
  @JsonKey(name: 'total_amount')
  int? get totalAmount;
  @override
  int? get total;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'menu_name')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_qty')
  String? get totalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  String? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get typeProduct => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'menu_name') String? menuName,
      @JsonKey(name: 'total_qty') String? totalQty,
      @JsonKey(name: 'total_price') String? totalPrice,
      @JsonKey(name: 'type') String? typeProduct});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuName = freezed,
    Object? totalQty = freezed,
    Object? totalPrice = freezed,
    Object? typeProduct = freezed,
  }) {
    return _then(_value.copyWith(
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProduct: freezed == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'menu_name') String? menuName,
      @JsonKey(name: 'total_qty') String? totalQty,
      @JsonKey(name: 'total_price') String? totalPrice,
      @JsonKey(name: 'type') String? typeProduct});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuName = freezed,
    Object? totalQty = freezed,
    Object? totalPrice = freezed,
    Object? typeProduct = freezed,
  }) {
    return _then(_$ProductImpl(
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProduct: freezed == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: 'menu_name') this.menuName,
      @JsonKey(name: 'total_qty') this.totalQty,
      @JsonKey(name: 'total_price') this.totalPrice,
      @JsonKey(name: 'type') this.typeProduct});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'menu_name')
  final String? menuName;
  @override
  @JsonKey(name: 'total_qty')
  final String? totalQty;
  @override
  @JsonKey(name: 'total_price')
  final String? totalPrice;
  @override
  @JsonKey(name: 'type')
  final String? typeProduct;

  @override
  String toString() {
    return 'Product(menuName: $menuName, totalQty: $totalQty, totalPrice: $totalPrice, typeProduct: $typeProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.typeProduct, typeProduct) ||
                other.typeProduct == typeProduct));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menuName, totalQty, totalPrice, typeProduct);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'menu_name') final String? menuName,
      @JsonKey(name: 'total_qty') final String? totalQty,
      @JsonKey(name: 'total_price') final String? totalPrice,
      @JsonKey(name: 'type') final String? typeProduct}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'menu_name')
  String? get menuName;
  @override
  @JsonKey(name: 'total_qty')
  String? get totalQty;
  @override
  @JsonKey(name: 'total_price')
  String? get totalPrice;
  @override
  @JsonKey(name: 'type')
  String? get typeProduct;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
