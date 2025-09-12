// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_transaction_detail_close.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDetailCloseLiteModel _$TransactionDetailCloseLiteModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionDetailCloseLiteModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetailCloseLiteModel {
  @JsonKey(name: 'transactionDetailID')
  int get transactionDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuID')
  int get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalQty')
  int get totalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPriceAfterDiscount')
  int get menuPriceAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'noteOption')
  String get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID')
  int? get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuImage')
  String get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusSend')
  int? get statusSend => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  int? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn')
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn => throw _privateConstructorUsedError;

  /// Serializes this TransactionDetailCloseLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionDetailCloseLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionDetailCloseLiteModelCopyWith<TransactionDetailCloseLiteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailCloseLiteModelCopyWith<$Res> {
  factory $TransactionDetailCloseLiteModelCopyWith(
          TransactionDetailCloseLiteModel value,
          $Res Function(TransactionDetailCloseLiteModel) then) =
      _$TransactionDetailCloseLiteModelCopyWithImpl<$Res,
          TransactionDetailCloseLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int transactionDetailID,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'totalQty') int totalQty,
      @JsonKey(name: 'totalPrice') int totalPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount') int menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String noteOption,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      List<Map<String, dynamic>> addOn});
}

/// @nodoc
class _$TransactionDetailCloseLiteModelCopyWithImpl<$Res,
        $Val extends TransactionDetailCloseLiteModel>
    implements $TransactionDetailCloseLiteModelCopyWith<$Res> {
  _$TransactionDetailCloseLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailCloseLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = null,
    Object? datetime = null,
    Object? transactionNumber = null,
    Object? menuID = null,
    Object? menuName = null,
    Object? totalQty = null,
    Object? totalPrice = null,
    Object? discountDetail = null,
    Object? menuPriceAfterDiscount = null,
    Object? noteOption = null,
    Object? parentID = freezed,
    Object? menuImage = null,
    Object? statusSend = freezed,
    Object? stationID = freezed,
    Object? addOn = null,
  }) {
    return _then(_value.copyWith(
      transactionDetailID: null == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
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
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
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
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailCloseLiteModelImplCopyWith<$Res>
    implements $TransactionDetailCloseLiteModelCopyWith<$Res> {
  factory _$$TransactionDetailCloseLiteModelImplCopyWith(
          _$TransactionDetailCloseLiteModelImpl value,
          $Res Function(_$TransactionDetailCloseLiteModelImpl) then) =
      __$$TransactionDetailCloseLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionDetailID') int transactionDetailID,
      @JsonKey(name: 'datetime') String datetime,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'totalQty') int totalQty,
      @JsonKey(name: 'totalPrice') int totalPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount') int menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') String noteOption,
      @JsonKey(name: 'parentID') int? parentID,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'statusSend') int? statusSend,
      @JsonKey(name: 'stationID') int? stationID,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      List<Map<String, dynamic>> addOn});
}

/// @nodoc
class __$$TransactionDetailCloseLiteModelImplCopyWithImpl<$Res>
    extends _$TransactionDetailCloseLiteModelCopyWithImpl<$Res,
        _$TransactionDetailCloseLiteModelImpl>
    implements _$$TransactionDetailCloseLiteModelImplCopyWith<$Res> {
  __$$TransactionDetailCloseLiteModelImplCopyWithImpl(
      _$TransactionDetailCloseLiteModelImpl _value,
      $Res Function(_$TransactionDetailCloseLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailCloseLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDetailID = null,
    Object? datetime = null,
    Object? transactionNumber = null,
    Object? menuID = null,
    Object? menuName = null,
    Object? totalQty = null,
    Object? totalPrice = null,
    Object? discountDetail = null,
    Object? menuPriceAfterDiscount = null,
    Object? noteOption = null,
    Object? parentID = freezed,
    Object? menuImage = null,
    Object? statusSend = freezed,
    Object? stationID = freezed,
    Object? addOn = null,
  }) {
    return _then(_$TransactionDetailCloseLiteModelImpl(
      transactionDetailID: null == transactionDetailID
          ? _value.transactionDetailID
          : transactionDetailID // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
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
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
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
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailCloseLiteModelImpl
    implements _TransactionDetailCloseLiteModel {
  const _$TransactionDetailCloseLiteModelImpl(
      {@JsonKey(name: 'transactionDetailID') required this.transactionDetailID,
      @JsonKey(name: 'datetime') required this.datetime,
      @JsonKey(name: 'transactionNumber') required this.transactionNumber,
      @JsonKey(name: 'menuID') required this.menuID,
      @JsonKey(name: 'menuName') required this.menuName,
      @JsonKey(name: 'totalQty') required this.totalQty,
      @JsonKey(name: 'totalPrice') required this.totalPrice,
      @JsonKey(name: 'discountDetail')
      @ListMapConverter()
      required final List<Map<String, dynamic>> discountDetail,
      @JsonKey(name: 'menuPriceAfterDiscount')
      required this.menuPriceAfterDiscount,
      @JsonKey(name: 'noteOption') required this.noteOption,
      @JsonKey(name: 'parentID') this.parentID,
      @JsonKey(name: 'menuImage') required this.menuImage,
      @JsonKey(name: 'statusSend') this.statusSend,
      @JsonKey(name: 'stationID') this.stationID,
      @JsonKey(name: 'addOn')
      @ListMapConverter()
      required final List<Map<String, dynamic>> addOn})
      : _discountDetail = discountDetail,
        _addOn = addOn;

  factory _$TransactionDetailCloseLiteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionDetailCloseLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'transactionDetailID')
  final int transactionDetailID;
  @override
  @JsonKey(name: 'datetime')
  final String datetime;
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
  @JsonKey(name: 'totalQty')
  final int totalQty;
  @override
  @JsonKey(name: 'totalPrice')
  final int totalPrice;
  final List<Map<String, dynamic>> _discountDetail;
  @override
  @JsonKey(name: 'discountDetail')
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
  String toString() {
    return 'TransactionDetailCloseLiteModel(transactionDetailID: $transactionDetailID, datetime: $datetime, transactionNumber: $transactionNumber, menuID: $menuID, menuName: $menuName, totalQty: $totalQty, totalPrice: $totalPrice, discountDetail: $discountDetail, menuPriceAfterDiscount: $menuPriceAfterDiscount, noteOption: $noteOption, parentID: $parentID, menuImage: $menuImage, statusSend: $statusSend, stationID: $stationID, addOn: $addOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailCloseLiteModelImpl &&
            (identical(other.transactionDetailID, transactionDetailID) ||
                other.transactionDetailID == transactionDetailID) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality()
                .equals(other._discountDetail, _discountDetail) &&
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
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDetailID,
      datetime,
      transactionNumber,
      menuID,
      menuName,
      totalQty,
      totalPrice,
      const DeepCollectionEquality().hash(_discountDetail),
      menuPriceAfterDiscount,
      noteOption,
      parentID,
      menuImage,
      statusSend,
      stationID,
      const DeepCollectionEquality().hash(_addOn));

  /// Create a copy of TransactionDetailCloseLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailCloseLiteModelImplCopyWith<
          _$TransactionDetailCloseLiteModelImpl>
      get copyWith => __$$TransactionDetailCloseLiteModelImplCopyWithImpl<
          _$TransactionDetailCloseLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailCloseLiteModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetailCloseLiteModel
    implements TransactionDetailCloseLiteModel {
  const factory _TransactionDetailCloseLiteModel(
          {@JsonKey(name: 'transactionDetailID')
          required final int transactionDetailID,
          @JsonKey(name: 'datetime') required final String datetime,
          @JsonKey(name: 'transactionNumber')
          required final String transactionNumber,
          @JsonKey(name: 'menuID') required final int menuID,
          @JsonKey(name: 'menuName') required final String menuName,
          @JsonKey(name: 'totalQty') required final int totalQty,
          @JsonKey(name: 'totalPrice') required final int totalPrice,
          @JsonKey(name: 'discountDetail')
          @ListMapConverter()
          required final List<Map<String, dynamic>> discountDetail,
          @JsonKey(name: 'menuPriceAfterDiscount')
          required final int menuPriceAfterDiscount,
          @JsonKey(name: 'noteOption') required final String noteOption,
          @JsonKey(name: 'parentID') final int? parentID,
          @JsonKey(name: 'menuImage') required final String menuImage,
          @JsonKey(name: 'statusSend') final int? statusSend,
          @JsonKey(name: 'stationID') final int? stationID,
          @JsonKey(name: 'addOn')
          @ListMapConverter()
          required final List<Map<String, dynamic>> addOn}) =
      _$TransactionDetailCloseLiteModelImpl;

  factory _TransactionDetailCloseLiteModel.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailCloseLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'transactionDetailID')
  int get transactionDetailID;
  @override
  @JsonKey(name: 'datetime')
  String get datetime;
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
  @JsonKey(name: 'totalQty')
  int get totalQty;
  @override
  @JsonKey(name: 'totalPrice')
  int get totalPrice;
  @override
  @JsonKey(name: 'discountDetail')
  @ListMapConverter()
  List<Map<String, dynamic>> get discountDetail;
  @override
  @JsonKey(name: 'menuPriceAfterDiscount')
  int get menuPriceAfterDiscount;
  @override
  @JsonKey(name: 'noteOption')
  String get noteOption;
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
  @JsonKey(name: 'addOn')
  @ListMapConverter()
  List<Map<String, dynamic>> get addOn;

  /// Create a copy of TransactionDetailCloseLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionDetailCloseLiteModelImplCopyWith<
          _$TransactionDetailCloseLiteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
