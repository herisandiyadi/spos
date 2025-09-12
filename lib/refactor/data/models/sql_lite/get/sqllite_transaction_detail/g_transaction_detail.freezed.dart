// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_transaction_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDetailLiteModel _$TransactionDetailLiteModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionDetailLiteModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetailLiteModel {
  @JsonKey(name: 'transactionDetailID')
  int get transactionDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuID')
  int get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPrice')
  int get menuPrice => throw _privateConstructorUsedError;
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPriceAfterDiscount')
  int get menuPriceAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'noteOption')
  String get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID')
  int? get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuImage')
  String get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusSend')
  int? get statusSend => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  int? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusItem')
  String get statusItem => throw _privateConstructorUsedError;
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn => throw _privateConstructorUsedError;

  /// Serializes this TransactionDetailLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionDetailLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionDetailLiteModelCopyWith<TransactionDetailLiteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailLiteModelCopyWith<$Res> {
  factory $TransactionDetailLiteModelCopyWith(TransactionDetailLiteModel value,
          $Res Function(TransactionDetailLiteModel) then) =
      _$TransactionDetailLiteModelCopyWithImpl<$Res,
          TransactionDetailLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int transactionDetailID,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'menuPrice') int menuPrice,
      @ListMapConverter() List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount') int menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String noteOption,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'statusItem') String statusItem,
      @ListMapConverter() List<Map<String, dynamic>> addOn});
}

/// @nodoc
class _$TransactionDetailLiteModelCopyWithImpl<$Res,
        $Val extends TransactionDetailLiteModel>
    implements $TransactionDetailLiteModelCopyWith<$Res> {
  _$TransactionDetailLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = null,
    Object? transactionNumber = null,
    Object? menuID = null,
    Object? menuName = null,
    Object? qty = null,
    Object? menuPrice = null,
    Object? discountDetail = null,
    Object? menuPriceAfterDiscount = null,
    Object? noteOption = null,
    Object? notes = null,
    Object? parentID = freezed,
    Object? menuImage = null,
    Object? statusSend = freezed,
    Object? stationID = freezed,
    Object? statusItem = null,
    Object? addOn = null,
  }) {
    return _then(_value.copyWith(
      transactionDetailID: null == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      menuID: null == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountDetail: null == discountDetail
          ? _value.discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      menuPriceAfterDiscount: null == menuPriceAfterDiscount
          ? _value.menuPriceAfterDiscount
          : menuPriceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      noteOption: null == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuImage: null == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String,
      statusSend: freezed == statusSend
          ? _value.statusSend
          : statusSend // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      statusItem: null == statusItem
          ? _value.statusItem
          : statusItem // ignore: cast_nullable_to_non_nullable
              as String,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailLiteModelImplCopyWith<$Res>
    implements $TransactionDetailLiteModelCopyWith<$Res> {
  factory _$$TransactionDetailLiteModelImplCopyWith(
          _$TransactionDetailLiteModelImpl value,
          $Res Function(_$TransactionDetailLiteModelImpl) then) =
      __$$TransactionDetailLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int transactionDetailID,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'menuPrice') int menuPrice,
      @ListMapConverter() List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount') int menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String noteOption,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'statusItem') String statusItem,
      @ListMapConverter() List<Map<String, dynamic>> addOn});
}

/// @nodoc
class __$$TransactionDetailLiteModelImplCopyWithImpl<$Res>
    extends _$TransactionDetailLiteModelCopyWithImpl<$Res,
        _$TransactionDetailLiteModelImpl>
    implements _$$TransactionDetailLiteModelImplCopyWith<$Res> {
  __$$TransactionDetailLiteModelImplCopyWithImpl(
      _$TransactionDetailLiteModelImpl _value,
      $Res Function(_$TransactionDetailLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = null,
    Object? transactionNumber = null,
    Object? menuID = null,
    Object? menuName = null,
    Object? qty = null,
    Object? menuPrice = null,
    Object? discountDetail = null,
    Object? menuPriceAfterDiscount = null,
    Object? noteOption = null,
    Object? notes = null,
    Object? parentID = freezed,
    Object? menuImage = null,
    Object? statusSend = freezed,
    Object? stationID = freezed,
    Object? statusItem = null,
    Object? addOn = null,
  }) {
    return _then(_$TransactionDetailLiteModelImpl(
      transactionDetailID: null == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      menuID: null == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountDetail: null == discountDetail
          ? _value._discountDetail
          : discountDetail // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      menuPriceAfterDiscount: null == menuPriceAfterDiscount
          ? _value.menuPriceAfterDiscount
          : menuPriceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      noteOption: null == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
      menuImage: null == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String,
      statusSend: freezed == statusSend
          ? _value.statusSend
          : statusSend // ignore: cast_nullable_to_non_nullable
              as int?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int?,
      statusItem: null == statusItem
          ? _value.statusItem
          : statusItem // ignore: cast_nullable_to_non_nullable
              as String,
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailLiteModelImpl
    with DiagnosticableTreeMixin
    implements _TransactionDetailLiteModel {
  const _$TransactionDetailLiteModelImpl(
      {@JsonKey(name: 'transactionDetailID') required this.transactionDetailID,
      @JsonKey(name: 'transactionNumber') required this.transactionNumber,
      @JsonKey(name: 'menuID') required this.menuID,
      @JsonKey(name: 'menuName') required this.menuName,
      @JsonKey(name: 'qty') required this.qty,
      @JsonKey(name: 'menuPrice') required this.menuPrice,
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount')
      required this.menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') required this.noteOption,
      @JsonKey(name: 'notes') required this.notes,
      @JsonKey(name: 'parentID') this.parentID,
      @JsonKey(name: 'menuImage') required this.menuImage,
      @JsonKey(name: 'statusSend') this.statusSend,
      @JsonKey(name: 'stationID') this.stationID,
      @JsonKey(name: 'statusItem') required this.statusItem,
      @ListMapConverter() required final List<Map<String, dynamic>> addOn})
      : _discountDetail = discountDetail,
        _addOn = addOn;

  factory _$TransactionDetailLiteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionDetailLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'transactionDetailID')
  final int transactionDetailID;
  @override
  @JsonKey(name: 'transactionNumber')
  final String transactionNumber;
  @override
  @JsonKey(name: 'menuID')
  final int menuID;
  @override
  @JsonKey(name: 'menuName')
  final String menuName;
  @override
  @JsonKey(name: 'qty')
  final int qty;
  @override
  @JsonKey(name: 'menuPrice')
  final int menuPrice;
  final List<Map<String, dynamic>> _discountDetail;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail {
    if (_discountDetail is EqualUnmodifiableListView) return _discountDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountDetail);
  }

  @override
  @JsonKey(name: 'menuPriceAfterDiscount')
  final int menuPriceAfterDiscount;
  @override
  @JsonKey(name: 'noteOption')
  final String noteOption;
  @override
  @JsonKey(name: 'notes')
  final String notes;
  @override
  @JsonKey(name: 'parentID')
  final int? parentID;
  @override
  @JsonKey(name: 'menuImage')
  final String menuImage;
  @override
  @JsonKey(name: 'statusSend')
  final int? statusSend;
  @override
  @JsonKey(name: 'stationID')
  final int? stationID;
  @override
  @JsonKey(name: 'statusItem')
  final String statusItem;
  final List<Map<String, dynamic>> _addOn;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn {
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOn);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionDetailLiteModel(transactionDetailID: $transactionDetailID, transactionNumber: $transactionNumber, menuID: $menuID, menuName: $menuName, qty: $qty, menuPrice: $menuPrice, discountDetail: $discountDetail, menuPriceAfterDiscount: $menuPriceAfterDiscount, noteOption: $noteOption, notes: $notes, parentID: $parentID, menuImage: $menuImage, statusSend: $statusSend, stationID: $stationID, statusItem: $statusItem, addOn: $addOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionDetailLiteModel'))
      ..add(DiagnosticsProperty('transactionDetailID', transactionDetailID))
      ..add(DiagnosticsProperty('transactionNumber', transactionNumber))
      ..add(DiagnosticsProperty('menuID', menuID))
      ..add(DiagnosticsProperty('menuName', menuName))
      ..add(DiagnosticsProperty('qty', qty))
      ..add(DiagnosticsProperty('menuPrice', menuPrice))
      ..add(DiagnosticsProperty('discountDetail', discountDetail))
      ..add(
          DiagnosticsProperty('menuPriceAfterDiscount', menuPriceAfterDiscount))
      ..add(DiagnosticsProperty('noteOption', noteOption))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('parentID', parentID))
      ..add(DiagnosticsProperty('menuImage', menuImage))
      ..add(DiagnosticsProperty('statusSend', statusSend))
      ..add(DiagnosticsProperty('stationID', stationID))
      ..add(DiagnosticsProperty('statusItem', statusItem))
      ..add(DiagnosticsProperty('addOn', addOn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailLiteModelImpl &&
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
            (identical(other.menuPriceAfterDiscount, menuPriceAfterDiscount) ||
                other.menuPriceAfterDiscount == menuPriceAfterDiscount) &&
            (identical(other.noteOption, noteOption) ||
                other.noteOption == noteOption) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.statusSend, statusSend) ||
                other.statusSend == statusSend) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.statusItem, statusItem) ||
                other.statusItem == statusItem) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn));
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
      menuPriceAfterDiscount,
      noteOption,
      notes,
      parentID,
      menuImage,
      statusSend,
      stationID,
      statusItem,
      const DeepCollectionEquality().hash(_addOn));

  /// Create a copy of TransactionDetailLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailLiteModelImplCopyWith<_$TransactionDetailLiteModelImpl>
      get copyWith => __$$TransactionDetailLiteModelImplCopyWithImpl<
          _$TransactionDetailLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailLiteModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetailLiteModel
    implements TransactionDetailLiteModel {
  const factory _TransactionDetailLiteModel(
          {@JsonKey(name: 'transactionDetailID')
          required final int transactionDetailID,
          @JsonKey(name: 'transactionNumber')
          required final String transactionNumber,
          @JsonKey(name: 'menuID') required final int menuID,
          @JsonKey(name: 'menuName') required final String menuName,
          @JsonKey(name: 'qty') required final int qty,
          @JsonKey(name: 'menuPrice') required final int menuPrice,
          @ListMapConverter()
          required final List<Map<String, dynamic>> discountDetail,
          @JsonKey(name: 'menuPriceAfterDiscount')
          required final int menuPriceAfterDiscount,
          @JsonKey(name: 'noteOption') required final String noteOption,
          @JsonKey(name: 'notes') required final String notes,
          @JsonKey(name: 'parentID') final int? parentID,
          @JsonKey(name: 'menuImage') required final String menuImage,
          @JsonKey(name: 'statusSend') final int? statusSend,
          @JsonKey(name: 'stationID') final int? stationID,
          @JsonKey(name: 'statusItem') required final String statusItem,
          @ListMapConverter()
          required final List<Map<String, dynamic>> addOn}) =
      _$TransactionDetailLiteModelImpl;

  factory _TransactionDetailLiteModel.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'transactionDetailID')
  int get transactionDetailID;
  @override
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber;
  @override
  @JsonKey(name: 'menuID')
  int get menuID;
  @override
  @JsonKey(name: 'menuName')
  String get menuName;
  @override
  @JsonKey(name: 'qty')
  int get qty;
  @override
  @JsonKey(name: 'menuPrice')
  int get menuPrice;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail;
  @override
  @JsonKey(name: 'menuPriceAfterDiscount')
  int get menuPriceAfterDiscount;
  @override
  @JsonKey(name: 'noteOption')
  String get noteOption;
  @override
  @JsonKey(name: 'notes')
  String get notes;
  @override
  @JsonKey(name: 'parentID')
  int? get parentID;
  @override
  @JsonKey(name: 'menuImage')
  String get menuImage;
  @override
  @JsonKey(name: 'statusSend')
  int? get statusSend;
  @override
  @JsonKey(name: 'stationID')
  int? get stationID;
  @override
  @JsonKey(name: 'statusItem')
  String get statusItem;
  @override
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn;

  /// Create a copy of TransactionDetailLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionDetailLiteModelImplCopyWith<_$TransactionDetailLiteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
