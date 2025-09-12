// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) {
  return _MenuModel.fromJson(json);
}

/// @nodoc
mixin _$MenuModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<MenuData> get data => throw _privateConstructorUsedError;

  /// Serializes this MenuModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuModelCopyWith<MenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuModelCopyWith<$Res> {
  factory $MenuModelCopyWith(MenuModel value, $Res Function(MenuModel) then) =
      _$MenuModelCopyWithImpl<$Res, MenuModel>;
  @useResult
  $Res call({String status, String? message, List<MenuData> data});
}

/// @nodoc
class _$MenuModelCopyWithImpl<$Res, $Val extends MenuModel>
    implements $MenuModelCopyWith<$Res> {
  _$MenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuModel
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
              as List<MenuData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuModelImplCopyWith<$Res>
    implements $MenuModelCopyWith<$Res> {
  factory _$$MenuModelImplCopyWith(
          _$MenuModelImpl value, $Res Function(_$MenuModelImpl) then) =
      __$$MenuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<MenuData> data});
}

/// @nodoc
class __$$MenuModelImplCopyWithImpl<$Res>
    extends _$MenuModelCopyWithImpl<$Res, _$MenuModelImpl>
    implements _$$MenuModelImplCopyWith<$Res> {
  __$$MenuModelImplCopyWithImpl(
      _$MenuModelImpl _value, $Res Function(_$MenuModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$MenuModelImpl(
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
              as List<MenuData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuModelImpl implements _MenuModel {
  const _$MenuModelImpl(
      {required this.status,
      this.message,
      final List<MenuData> data = const []})
      : _data = data;

  factory _$MenuModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<MenuData> _data;
  @override
  @JsonKey()
  List<MenuData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MenuModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of MenuModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuModelImplCopyWith<_$MenuModelImpl> get copyWith =>
      __$$MenuModelImplCopyWithImpl<_$MenuModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuModelImplToJson(
      this,
    );
  }
}

abstract class _MenuModel implements MenuModel {
  const factory _MenuModel(
      {required final String status,
      final String? message,
      final List<MenuData> data}) = _$MenuModelImpl;

  factory _MenuModel.fromJson(Map<String, dynamic> json) =
      _$MenuModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<MenuData> get data;

  /// Create a copy of MenuModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuModelImplCopyWith<_$MenuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuData _$MenuDataFromJson(Map<String, dynamic> json) {
  return _MenuData.fromJson(json);
}

/// @nodoc
mixin _$MenuData {
  @JsonKey(name: 'MenuID')
  String? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuCode')
  String? get menuCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryID')
  String? get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryName')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubCategoryID')
  String? get subCategoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubCategoryName')
  String? get subCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationID')
  String? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationName')
  String? get stationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuType')
  String? get menuType => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddOn')
  List<MenuAddOnGroup> get addOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoteOption')
  List<String> get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'Variant')
  List<dynamic> get variant => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowStatusPos')
  String? get showStatusPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowStatusApps')
  String? get showStatusApps => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvailOutlet')
  List<AvailOutlet> get availOutlet => throw _privateConstructorUsedError;
  @JsonKey(name: 'Arrange')
  int? get arrange => throw _privateConstructorUsedError;

  /// Serializes this MenuData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuDataCopyWith<MenuData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDataCopyWith<$Res> {
  factory $MenuDataCopyWith(MenuData value, $Res Function(MenuData) then) =
      _$MenuDataCopyWithImpl<$Res, MenuData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') String? menuID,
      @JsonKey(name: 'MenuCode') String? menuCode,
      @JsonKey(name: 'CategoryID') String? categoryID,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'CategoryName') String? categoryName,
      @JsonKey(name: 'SubCategoryID') String? subCategoryID,
      @JsonKey(name: 'SubCategoryName') String? subCategoryName,
      @JsonKey(name: 'StationID') String? stationID,
      @JsonKey(name: 'StationName') String? stationName,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'MenuDesc') String? menuDesc,
      @JsonKey(name: 'MenuPrice') String? menuPrice,
      @JsonKey(name: 'MenuDiscount') String? menuDiscount,
      @JsonKey(name: 'MenuType') String? menuType,
      @JsonKey(name: 'AddOn') List<MenuAddOnGroup> addOn,
      @JsonKey(name: 'NoteOption') List<String> noteOption,
      @JsonKey(name: 'Variant') List<dynamic> variant,
      @JsonKey(name: 'ShowStatusPos') String? showStatusPos,
      @JsonKey(name: 'ShowStatusApps') String? showStatusApps,
      @JsonKey(name: 'AvailOutlet') List<AvailOutlet> availOutlet,
      @JsonKey(name: 'Arrange') int? arrange});
}

/// @nodoc
class _$MenuDataCopyWithImpl<$Res, $Val extends MenuData>
    implements $MenuDataCopyWith<$Res> {
  _$MenuDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuCode = freezed,
    Object? categoryID = freezed,
    Object? menuImage = freezed,
    Object? categoryName = freezed,
    Object? subCategoryID = freezed,
    Object? subCategoryName = freezed,
    Object? stationID = freezed,
    Object? stationName = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
    Object? menuType = freezed,
    Object? addOn = null,
    Object? noteOption = null,
    Object? variant = null,
    Object? showStatusPos = freezed,
    Object? showStatusApps = freezed,
    Object? availOutlet = null,
    Object? arrange = freezed,
  }) {
    return _then(_value.copyWith(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuCode: freezed == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryID: freezed == subCategoryID
          ? _value.subCategoryID
          : subCategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      menuType: freezed == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String?,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnGroup>,
      noteOption: null == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      showStatusPos: freezed == showStatusPos
          ? _value.showStatusPos
          : showStatusPos // ignore: cast_nullable_to_non_nullable
              as String?,
      showStatusApps: freezed == showStatusApps
          ? _value.showStatusApps
          : showStatusApps // ignore: cast_nullable_to_non_nullable
              as String?,
      availOutlet: null == availOutlet
          ? _value.availOutlet
          : availOutlet // ignore: cast_nullable_to_non_nullable
              as List<AvailOutlet>,
      arrange: freezed == arrange
          ? _value.arrange
          : arrange // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuDataImplCopyWith<$Res>
    implements $MenuDataCopyWith<$Res> {
  factory _$$MenuDataImplCopyWith(
          _$MenuDataImpl value, $Res Function(_$MenuDataImpl) then) =
      __$$MenuDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') String? menuID,
      @JsonKey(name: 'MenuCode') String? menuCode,
      @JsonKey(name: 'CategoryID') String? categoryID,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'CategoryName') String? categoryName,
      @JsonKey(name: 'SubCategoryID') String? subCategoryID,
      @JsonKey(name: 'SubCategoryName') String? subCategoryName,
      @JsonKey(name: 'StationID') String? stationID,
      @JsonKey(name: 'StationName') String? stationName,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'MenuDesc') String? menuDesc,
      @JsonKey(name: 'MenuPrice') String? menuPrice,
      @JsonKey(name: 'MenuDiscount') String? menuDiscount,
      @JsonKey(name: 'MenuType') String? menuType,
      @JsonKey(name: 'AddOn') List<MenuAddOnGroup> addOn,
      @JsonKey(name: 'NoteOption') List<String> noteOption,
      @JsonKey(name: 'Variant') List<dynamic> variant,
      @JsonKey(name: 'ShowStatusPos') String? showStatusPos,
      @JsonKey(name: 'ShowStatusApps') String? showStatusApps,
      @JsonKey(name: 'AvailOutlet') List<AvailOutlet> availOutlet,
      @JsonKey(name: 'Arrange') int? arrange});
}

/// @nodoc
class __$$MenuDataImplCopyWithImpl<$Res>
    extends _$MenuDataCopyWithImpl<$Res, _$MenuDataImpl>
    implements _$$MenuDataImplCopyWith<$Res> {
  __$$MenuDataImplCopyWithImpl(
      _$MenuDataImpl _value, $Res Function(_$MenuDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuCode = freezed,
    Object? categoryID = freezed,
    Object? menuImage = freezed,
    Object? categoryName = freezed,
    Object? subCategoryID = freezed,
    Object? subCategoryName = freezed,
    Object? stationID = freezed,
    Object? stationName = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
    Object? menuType = freezed,
    Object? addOn = null,
    Object? noteOption = null,
    Object? variant = null,
    Object? showStatusPos = freezed,
    Object? showStatusApps = freezed,
    Object? availOutlet = null,
    Object? arrange = freezed,
  }) {
    return _then(_$MenuDataImpl(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuCode: freezed == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryID: freezed == subCategoryID
          ? _value.subCategoryID
          : subCategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      menuType: freezed == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String?,
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnGroup>,
      noteOption: null == noteOption
          ? _value._noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variant: null == variant
          ? _value._variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      showStatusPos: freezed == showStatusPos
          ? _value.showStatusPos
          : showStatusPos // ignore: cast_nullable_to_non_nullable
              as String?,
      showStatusApps: freezed == showStatusApps
          ? _value.showStatusApps
          : showStatusApps // ignore: cast_nullable_to_non_nullable
              as String?,
      availOutlet: null == availOutlet
          ? _value._availOutlet
          : availOutlet // ignore: cast_nullable_to_non_nullable
              as List<AvailOutlet>,
      arrange: freezed == arrange
          ? _value.arrange
          : arrange // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuDataImpl implements _MenuData {
  const _$MenuDataImpl(
      {@JsonKey(name: 'MenuID') this.menuID,
      @JsonKey(name: 'MenuCode') this.menuCode,
      @JsonKey(name: 'CategoryID') this.categoryID,
      @JsonKey(name: 'MenuImage') this.menuImage,
      @JsonKey(name: 'CategoryName') this.categoryName,
      @JsonKey(name: 'SubCategoryID') this.subCategoryID,
      @JsonKey(name: 'SubCategoryName') this.subCategoryName,
      @JsonKey(name: 'StationID') this.stationID,
      @JsonKey(name: 'StationName') this.stationName,
      @JsonKey(name: 'MenuName') this.menuName,
      @JsonKey(name: 'MenuDesc') this.menuDesc,
      @JsonKey(name: 'MenuPrice') this.menuPrice,
      @JsonKey(name: 'MenuDiscount') this.menuDiscount,
      @JsonKey(name: 'MenuType') this.menuType,
      @JsonKey(name: 'AddOn') final List<MenuAddOnGroup> addOn = const [],
      @JsonKey(name: 'NoteOption') final List<String> noteOption = const [],
      @JsonKey(name: 'Variant') final List<dynamic> variant = const [],
      @JsonKey(name: 'ShowStatusPos') this.showStatusPos,
      @JsonKey(name: 'ShowStatusApps') this.showStatusApps,
      @JsonKey(name: 'AvailOutlet')
      final List<AvailOutlet> availOutlet = const [],
      @JsonKey(name: 'Arrange') this.arrange})
      : _addOn = addOn,
        _noteOption = noteOption,
        _variant = variant,
        _availOutlet = availOutlet;

  factory _$MenuDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuDataImplFromJson(json);

  @override
  @JsonKey(name: 'MenuID')
  final String? menuID;
  @override
  @JsonKey(name: 'MenuCode')
  final String? menuCode;
  @override
  @JsonKey(name: 'CategoryID')
  final String? categoryID;
  @override
  @JsonKey(name: 'MenuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'CategoryName')
  final String? categoryName;
  @override
  @JsonKey(name: 'SubCategoryID')
  final String? subCategoryID;
  @override
  @JsonKey(name: 'SubCategoryName')
  final String? subCategoryName;
  @override
  @JsonKey(name: 'StationID')
  final String? stationID;
  @override
  @JsonKey(name: 'StationName')
  final String? stationName;
  @override
  @JsonKey(name: 'MenuName')
  final String? menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  final String? menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  final String? menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  final String? menuDiscount;
  @override
  @JsonKey(name: 'MenuType')
  final String? menuType;
  final List<MenuAddOnGroup> _addOn;
  @override
  @JsonKey(name: 'AddOn')
  List<MenuAddOnGroup> get addOn {
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOn);
  }

  final List<String> _noteOption;
  @override
  @JsonKey(name: 'NoteOption')
  List<String> get noteOption {
    if (_noteOption is EqualUnmodifiableListView) return _noteOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteOption);
  }

  final List<dynamic> _variant;
  @override
  @JsonKey(name: 'Variant')
  List<dynamic> get variant {
    if (_variant is EqualUnmodifiableListView) return _variant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variant);
  }

  @override
  @JsonKey(name: 'ShowStatusPos')
  final String? showStatusPos;
  @override
  @JsonKey(name: 'ShowStatusApps')
  final String? showStatusApps;
  final List<AvailOutlet> _availOutlet;
  @override
  @JsonKey(name: 'AvailOutlet')
  List<AvailOutlet> get availOutlet {
    if (_availOutlet is EqualUnmodifiableListView) return _availOutlet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availOutlet);
  }

  @override
  @JsonKey(name: 'Arrange')
  final int? arrange;

  @override
  String toString() {
    return 'MenuData(menuID: $menuID, menuCode: $menuCode, categoryID: $categoryID, menuImage: $menuImage, categoryName: $categoryName, subCategoryID: $subCategoryID, subCategoryName: $subCategoryName, stationID: $stationID, stationName: $stationName, menuName: $menuName, menuDesc: $menuDesc, menuPrice: $menuPrice, menuDiscount: $menuDiscount, menuType: $menuType, addOn: $addOn, noteOption: $noteOption, variant: $variant, showStatusPos: $showStatusPos, showStatusApps: $showStatusApps, availOutlet: $availOutlet, arrange: $arrange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuDataImpl &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuCode, menuCode) ||
                other.menuCode == menuCode) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.subCategoryID, subCategoryID) ||
                other.subCategoryID == subCategoryID) &&
            (identical(other.subCategoryName, subCategoryName) ||
                other.subCategoryName == subCategoryName) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menuDesc, menuDesc) ||
                other.menuDesc == menuDesc) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.menuDiscount, menuDiscount) ||
                other.menuDiscount == menuDiscount) &&
            (identical(other.menuType, menuType) ||
                other.menuType == menuType) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn) &&
            const DeepCollectionEquality()
                .equals(other._noteOption, _noteOption) &&
            const DeepCollectionEquality().equals(other._variant, _variant) &&
            (identical(other.showStatusPos, showStatusPos) ||
                other.showStatusPos == showStatusPos) &&
            (identical(other.showStatusApps, showStatusApps) ||
                other.showStatusApps == showStatusApps) &&
            const DeepCollectionEquality()
                .equals(other._availOutlet, _availOutlet) &&
            (identical(other.arrange, arrange) || other.arrange == arrange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        menuID,
        menuCode,
        categoryID,
        menuImage,
        categoryName,
        subCategoryID,
        subCategoryName,
        stationID,
        stationName,
        menuName,
        menuDesc,
        menuPrice,
        menuDiscount,
        menuType,
        const DeepCollectionEquality().hash(_addOn),
        const DeepCollectionEquality().hash(_noteOption),
        const DeepCollectionEquality().hash(_variant),
        showStatusPos,
        showStatusApps,
        const DeepCollectionEquality().hash(_availOutlet),
        arrange
      ]);

  /// Create a copy of MenuData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuDataImplCopyWith<_$MenuDataImpl> get copyWith =>
      __$$MenuDataImplCopyWithImpl<_$MenuDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuDataImplToJson(
      this,
    );
  }
}

abstract class _MenuData implements MenuData {
  const factory _MenuData(
      {@JsonKey(name: 'MenuID') final String? menuID,
      @JsonKey(name: 'MenuCode') final String? menuCode,
      @JsonKey(name: 'CategoryID') final String? categoryID,
      @JsonKey(name: 'MenuImage') final String? menuImage,
      @JsonKey(name: 'CategoryName') final String? categoryName,
      @JsonKey(name: 'SubCategoryID') final String? subCategoryID,
      @JsonKey(name: 'SubCategoryName') final String? subCategoryName,
      @JsonKey(name: 'StationID') final String? stationID,
      @JsonKey(name: 'StationName') final String? stationName,
      @JsonKey(name: 'MenuName') final String? menuName,
      @JsonKey(name: 'MenuDesc') final String? menuDesc,
      @JsonKey(name: 'MenuPrice') final String? menuPrice,
      @JsonKey(name: 'MenuDiscount') final String? menuDiscount,
      @JsonKey(name: 'MenuType') final String? menuType,
      @JsonKey(name: 'AddOn') final List<MenuAddOnGroup> addOn,
      @JsonKey(name: 'NoteOption') final List<String> noteOption,
      @JsonKey(name: 'Variant') final List<dynamic> variant,
      @JsonKey(name: 'ShowStatusPos') final String? showStatusPos,
      @JsonKey(name: 'ShowStatusApps') final String? showStatusApps,
      @JsonKey(name: 'AvailOutlet') final List<AvailOutlet> availOutlet,
      @JsonKey(name: 'Arrange') final int? arrange}) = _$MenuDataImpl;

  factory _MenuData.fromJson(Map<String, dynamic> json) =
      _$MenuDataImpl.fromJson;

  @override
  @JsonKey(name: 'MenuID')
  String? get menuID;
  @override
  @JsonKey(name: 'MenuCode')
  String? get menuCode;
  @override
  @JsonKey(name: 'CategoryID')
  String? get categoryID;
  @override
  @JsonKey(name: 'MenuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'CategoryName')
  String? get categoryName;
  @override
  @JsonKey(name: 'SubCategoryID')
  String? get subCategoryID;
  @override
  @JsonKey(name: 'SubCategoryName')
  String? get subCategoryName;
  @override
  @JsonKey(name: 'StationID')
  String? get stationID;
  @override
  @JsonKey(name: 'StationName')
  String? get stationName;
  @override
  @JsonKey(name: 'MenuName')
  String? get menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount;
  @override
  @JsonKey(name: 'MenuType')
  String? get menuType;
  @override
  @JsonKey(name: 'AddOn')
  List<MenuAddOnGroup> get addOn;
  @override
  @JsonKey(name: 'NoteOption')
  List<String> get noteOption;
  @override
  @JsonKey(name: 'Variant')
  List<dynamic> get variant;
  @override
  @JsonKey(name: 'ShowStatusPos')
  String? get showStatusPos;
  @override
  @JsonKey(name: 'ShowStatusApps')
  String? get showStatusApps;
  @override
  @JsonKey(name: 'AvailOutlet')
  List<AvailOutlet> get availOutlet;
  @override
  @JsonKey(name: 'Arrange')
  int? get arrange;

  /// Create a copy of MenuData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuDataImplCopyWith<_$MenuDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuAddOnGroup _$MenuAddOnGroupFromJson(Map<String, dynamic> json) {
  return _MenuAddOnGroup.fromJson(json);
}

/// @nodoc
mixin _$MenuAddOnGroup {
  @JsonKey(name: 'MenuAddOn')
  List<MenuAddOnItem> get menuAddOn => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get multiply => throw _privateConstructorUsedError;
  int? get required => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  /// Serializes this MenuAddOnGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuAddOnGroupCopyWith<MenuAddOnGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuAddOnGroupCopyWith<$Res> {
  factory $MenuAddOnGroupCopyWith(
          MenuAddOnGroup value, $Res Function(MenuAddOnGroup) then) =
      _$MenuAddOnGroupCopyWithImpl<$Res, MenuAddOnGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuAddOn') List<MenuAddOnItem> menuAddOn,
      String? title,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class _$MenuAddOnGroupCopyWithImpl<$Res, $Val extends MenuAddOnGroup>
    implements $MenuAddOnGroupCopyWith<$Res> {
  _$MenuAddOnGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuAddOn = null,
    Object? title = freezed,
    Object? multiply = freezed,
    Object? required = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      menuAddOn: null == menuAddOn
          ? _value.menuAddOn
          : menuAddOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnItem>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      multiply: freezed == multiply
          ? _value.multiply
          : multiply // ignore: cast_nullable_to_non_nullable
              as int?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuAddOnGroupImplCopyWith<$Res>
    implements $MenuAddOnGroupCopyWith<$Res> {
  factory _$$MenuAddOnGroupImplCopyWith(_$MenuAddOnGroupImpl value,
          $Res Function(_$MenuAddOnGroupImpl) then) =
      __$$MenuAddOnGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuAddOn') List<MenuAddOnItem> menuAddOn,
      String? title,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class __$$MenuAddOnGroupImplCopyWithImpl<$Res>
    extends _$MenuAddOnGroupCopyWithImpl<$Res, _$MenuAddOnGroupImpl>
    implements _$$MenuAddOnGroupImplCopyWith<$Res> {
  __$$MenuAddOnGroupImplCopyWithImpl(
      _$MenuAddOnGroupImpl _value, $Res Function(_$MenuAddOnGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuAddOn = null,
    Object? title = freezed,
    Object? multiply = freezed,
    Object? required = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$MenuAddOnGroupImpl(
      menuAddOn: null == menuAddOn
          ? _value._menuAddOn
          : menuAddOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnItem>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      multiply: freezed == multiply
          ? _value.multiply
          : multiply // ignore: cast_nullable_to_non_nullable
              as int?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuAddOnGroupImpl implements _MenuAddOnGroup {
  const _$MenuAddOnGroupImpl(
      {@JsonKey(name: 'MenuAddOn')
      final List<MenuAddOnItem> menuAddOn = const [],
      this.title,
      this.multiply,
      this.required,
      this.min,
      this.max})
      : _menuAddOn = menuAddOn;

  factory _$MenuAddOnGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuAddOnGroupImplFromJson(json);

  final List<MenuAddOnItem> _menuAddOn;
  @override
  @JsonKey(name: 'MenuAddOn')
  List<MenuAddOnItem> get menuAddOn {
    if (_menuAddOn is EqualUnmodifiableListView) return _menuAddOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuAddOn);
  }

  @override
  final String? title;
  @override
  final int? multiply;
  @override
  final int? required;
  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'MenuAddOnGroup(menuAddOn: $menuAddOn, title: $title, multiply: $multiply, required: $required, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuAddOnGroupImpl &&
            const DeepCollectionEquality()
                .equals(other._menuAddOn, _menuAddOn) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.multiply, multiply) ||
                other.multiply == multiply) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_menuAddOn),
      title,
      multiply,
      required,
      min,
      max);

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuAddOnGroupImplCopyWith<_$MenuAddOnGroupImpl> get copyWith =>
      __$$MenuAddOnGroupImplCopyWithImpl<_$MenuAddOnGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuAddOnGroupImplToJson(
      this,
    );
  }
}

abstract class _MenuAddOnGroup implements MenuAddOnGroup {
  const factory _MenuAddOnGroup(
      {@JsonKey(name: 'MenuAddOn') final List<MenuAddOnItem> menuAddOn,
      final String? title,
      final int? multiply,
      final int? required,
      final int? min,
      final int? max}) = _$MenuAddOnGroupImpl;

  factory _MenuAddOnGroup.fromJson(Map<String, dynamic> json) =
      _$MenuAddOnGroupImpl.fromJson;

  @override
  @JsonKey(name: 'MenuAddOn')
  List<MenuAddOnItem> get menuAddOn;
  @override
  String? get title;
  @override
  int? get multiply;
  @override
  int? get required;
  @override
  int? get min;
  @override
  int? get max;

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuAddOnGroupImplCopyWith<_$MenuAddOnGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuAddOnItem _$MenuAddOnItemFromJson(Map<String, dynamic> json) {
  return _MenuAddOnItem.fromJson(json);
}

/// @nodoc
mixin _$MenuAddOnItem {
  @JsonKey(name: 'MenuID')
  String? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount => throw _privateConstructorUsedError;

  /// Serializes this MenuAddOnItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuAddOnItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuAddOnItemCopyWith<MenuAddOnItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuAddOnItemCopyWith<$Res> {
  factory $MenuAddOnItemCopyWith(
          MenuAddOnItem value, $Res Function(MenuAddOnItem) then) =
      _$MenuAddOnItemCopyWithImpl<$Res, MenuAddOnItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') String? menuID,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'MenuDesc') String? menuDesc,
      @JsonKey(name: 'MenuPrice') String? menuPrice,
      @JsonKey(name: 'MenuDiscount') String? menuDiscount});
}

/// @nodoc
class _$MenuAddOnItemCopyWithImpl<$Res, $Val extends MenuAddOnItem>
    implements $MenuAddOnItemCopyWith<$Res> {
  _$MenuAddOnItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuAddOnItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuAddOnItemImplCopyWith<$Res>
    implements $MenuAddOnItemCopyWith<$Res> {
  factory _$$MenuAddOnItemImplCopyWith(
          _$MenuAddOnItemImpl value, $Res Function(_$MenuAddOnItemImpl) then) =
      __$$MenuAddOnItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MenuID') String? menuID,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'MenuDesc') String? menuDesc,
      @JsonKey(name: 'MenuPrice') String? menuPrice,
      @JsonKey(name: 'MenuDiscount') String? menuDiscount});
}

/// @nodoc
class __$$MenuAddOnItemImplCopyWithImpl<$Res>
    extends _$MenuAddOnItemCopyWithImpl<$Res, _$MenuAddOnItemImpl>
    implements _$$MenuAddOnItemImplCopyWith<$Res> {
  __$$MenuAddOnItemImplCopyWithImpl(
      _$MenuAddOnItemImpl _value, $Res Function(_$MenuAddOnItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuAddOnItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
  }) {
    return _then(_$MenuAddOnItemImpl(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuAddOnItemImpl implements _MenuAddOnItem {
  const _$MenuAddOnItemImpl(
      {@JsonKey(name: 'MenuID') this.menuID,
      @JsonKey(name: 'MenuName') this.menuName,
      @JsonKey(name: 'MenuDesc') this.menuDesc,
      @JsonKey(name: 'MenuPrice') this.menuPrice,
      @JsonKey(name: 'MenuDiscount') this.menuDiscount});

  factory _$MenuAddOnItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuAddOnItemImplFromJson(json);

  @override
  @JsonKey(name: 'MenuID')
  final String? menuID;
  @override
  @JsonKey(name: 'MenuName')
  final String? menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  final String? menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  final String? menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  final String? menuDiscount;

  @override
  String toString() {
    return 'MenuAddOnItem(menuID: $menuID, menuName: $menuName, menuDesc: $menuDesc, menuPrice: $menuPrice, menuDiscount: $menuDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuAddOnItemImpl &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menuDesc, menuDesc) ||
                other.menuDesc == menuDesc) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.menuDiscount, menuDiscount) ||
                other.menuDiscount == menuDiscount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, menuID, menuName, menuDesc, menuPrice, menuDiscount);

  /// Create a copy of MenuAddOnItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuAddOnItemImplCopyWith<_$MenuAddOnItemImpl> get copyWith =>
      __$$MenuAddOnItemImplCopyWithImpl<_$MenuAddOnItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuAddOnItemImplToJson(
      this,
    );
  }
}

abstract class _MenuAddOnItem implements MenuAddOnItem {
  const factory _MenuAddOnItem(
          {@JsonKey(name: 'MenuID') final String? menuID,
          @JsonKey(name: 'MenuName') final String? menuName,
          @JsonKey(name: 'MenuDesc') final String? menuDesc,
          @JsonKey(name: 'MenuPrice') final String? menuPrice,
          @JsonKey(name: 'MenuDiscount') final String? menuDiscount}) =
      _$MenuAddOnItemImpl;

  factory _MenuAddOnItem.fromJson(Map<String, dynamic> json) =
      _$MenuAddOnItemImpl.fromJson;

  @override
  @JsonKey(name: 'MenuID')
  String? get menuID;
  @override
  @JsonKey(name: 'MenuName')
  String? get menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount;

  /// Create a copy of MenuAddOnItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuAddOnItemImplCopyWith<_$MenuAddOnItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailOutlet _$AvailOutletFromJson(Map<String, dynamic> json) {
  return _AvailOutlet.fromJson(json);
}

/// @nodoc
mixin _$AvailOutlet {
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletCode')
  String? get outletCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletName')
  String? get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletImage')
  String? get outletImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletClose')
  String? get outletClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletFB')
  String? get outletFB => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletIG')
  String? get outletIG => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTiktok => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApiKey')
  String? get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this AvailOutlet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailOutlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailOutletCopyWith<AvailOutlet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailOutletCopyWith<$Res> {
  factory $AvailOutletCopyWith(
          AvailOutlet value, $Res Function(AvailOutlet) then) =
      _$AvailOutletCopyWithImpl<$Res, AvailOutlet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'OutletCode') String? outletCode,
      @JsonKey(name: 'OutletName') String? outletName,
      @JsonKey(name: 'OutletAddress') String? outletAddress,
      @JsonKey(name: 'OutletImage') String? outletImage,
      @JsonKey(name: 'OutletOpen') String? outletOpen,
      @JsonKey(name: 'OutletClose') String? outletClose,
      @JsonKey(name: 'OutletFB') String? outletFB,
      @JsonKey(name: 'OutletIG') String? outletIG,
      @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
      @JsonKey(name: 'OutletWeb') String? outletWeb,
      @JsonKey(name: 'ApiKey') String? apiKey,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class _$AvailOutletCopyWithImpl<$Res, $Val extends AvailOutlet>
    implements $AvailOutletCopyWith<$Res> {
  _$AvailOutletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailOutlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletID = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTiktok = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTiktok: freezed == outletTiktok
          ? _value.outletTiktok
          : outletTiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailOutletImplCopyWith<$Res>
    implements $AvailOutletCopyWith<$Res> {
  factory _$$AvailOutletImplCopyWith(
          _$AvailOutletImpl value, $Res Function(_$AvailOutletImpl) then) =
      __$$AvailOutletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'OutletCode') String? outletCode,
      @JsonKey(name: 'OutletName') String? outletName,
      @JsonKey(name: 'OutletAddress') String? outletAddress,
      @JsonKey(name: 'OutletImage') String? outletImage,
      @JsonKey(name: 'OutletOpen') String? outletOpen,
      @JsonKey(name: 'OutletClose') String? outletClose,
      @JsonKey(name: 'OutletFB') String? outletFB,
      @JsonKey(name: 'OutletIG') String? outletIG,
      @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
      @JsonKey(name: 'OutletWeb') String? outletWeb,
      @JsonKey(name: 'ApiKey') String? apiKey,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(name: 'is_deleted') String? isDeleted});
}

/// @nodoc
class __$$AvailOutletImplCopyWithImpl<$Res>
    extends _$AvailOutletCopyWithImpl<$Res, _$AvailOutletImpl>
    implements _$$AvailOutletImplCopyWith<$Res> {
  __$$AvailOutletImplCopyWithImpl(
      _$AvailOutletImpl _value, $Res Function(_$AvailOutletImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailOutlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletID = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTiktok = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$AvailOutletImpl(
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTiktok: freezed == outletTiktok
          ? _value.outletTiktok
          : outletTiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
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
class _$AvailOutletImpl implements _AvailOutlet {
  const _$AvailOutletImpl(
      {@JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'OutletCode') this.outletCode,
      @JsonKey(name: 'OutletName') this.outletName,
      @JsonKey(name: 'OutletAddress') this.outletAddress,
      @JsonKey(name: 'OutletImage') this.outletImage,
      @JsonKey(name: 'OutletOpen') this.outletOpen,
      @JsonKey(name: 'OutletClose') this.outletClose,
      @JsonKey(name: 'OutletFB') this.outletFB,
      @JsonKey(name: 'OutletIG') this.outletIG,
      @JsonKey(name: 'OutletTIKTOK') this.outletTiktok,
      @JsonKey(name: 'OutletWeb') this.outletWeb,
      @JsonKey(name: 'ApiKey') this.apiKey,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(name: 'is_deleted') this.isDeleted});

  factory _$AvailOutletImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailOutletImplFromJson(json);

  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'OutletCode')
  final String? outletCode;
  @override
  @JsonKey(name: 'OutletName')
  final String? outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  final String? outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  final String? outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  final String? outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  final String? outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  final String? outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  final String? outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  final String? outletTiktok;
  @override
  @JsonKey(name: 'OutletWeb')
  final String? outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  final String? apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;

  @override
  String toString() {
    return 'AvailOutlet(outletID: $outletID, outletCode: $outletCode, outletName: $outletName, outletAddress: $outletAddress, outletImage: $outletImage, outletOpen: $outletOpen, outletClose: $outletClose, outletFB: $outletFB, outletIG: $outletIG, outletTiktok: $outletTiktok, outletWeb: $outletWeb, apiKey: $apiKey, companyCode: $companyCode, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailOutletImpl &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletAddress, outletAddress) ||
                other.outletAddress == outletAddress) &&
            (identical(other.outletImage, outletImage) ||
                other.outletImage == outletImage) &&
            (identical(other.outletOpen, outletOpen) ||
                other.outletOpen == outletOpen) &&
            (identical(other.outletClose, outletClose) ||
                other.outletClose == outletClose) &&
            (identical(other.outletFB, outletFB) ||
                other.outletFB == outletFB) &&
            (identical(other.outletIG, outletIG) ||
                other.outletIG == outletIG) &&
            (identical(other.outletTiktok, outletTiktok) ||
                other.outletTiktok == outletTiktok) &&
            (identical(other.outletWeb, outletWeb) ||
                other.outletWeb == outletWeb) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      outletID,
      outletCode,
      outletName,
      outletAddress,
      outletImage,
      outletOpen,
      outletClose,
      outletFB,
      outletIG,
      outletTiktok,
      outletWeb,
      apiKey,
      companyCode,
      isDeleted);

  /// Create a copy of AvailOutlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailOutletImplCopyWith<_$AvailOutletImpl> get copyWith =>
      __$$AvailOutletImplCopyWithImpl<_$AvailOutletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailOutletImplToJson(
      this,
    );
  }
}

abstract class _AvailOutlet implements AvailOutlet {
  const factory _AvailOutlet(
          {@JsonKey(name: 'OutletID') final String? outletID,
          @JsonKey(name: 'OutletCode') final String? outletCode,
          @JsonKey(name: 'OutletName') final String? outletName,
          @JsonKey(name: 'OutletAddress') final String? outletAddress,
          @JsonKey(name: 'OutletImage') final String? outletImage,
          @JsonKey(name: 'OutletOpen') final String? outletOpen,
          @JsonKey(name: 'OutletClose') final String? outletClose,
          @JsonKey(name: 'OutletFB') final String? outletFB,
          @JsonKey(name: 'OutletIG') final String? outletIG,
          @JsonKey(name: 'OutletTIKTOK') final String? outletTiktok,
          @JsonKey(name: 'OutletWeb') final String? outletWeb,
          @JsonKey(name: 'ApiKey') final String? apiKey,
          @JsonKey(name: 'CompanyCode') final String? companyCode,
          @JsonKey(name: 'is_deleted') final String? isDeleted}) =
      _$AvailOutletImpl;

  factory _AvailOutlet.fromJson(Map<String, dynamic> json) =
      _$AvailOutletImpl.fromJson;

  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'OutletCode')
  String? get outletCode;
  @override
  @JsonKey(name: 'OutletName')
  String? get outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  String? get outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  String? get outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  String? get outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  String? get outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTiktok;
  @override
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  String? get apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;

  /// Create a copy of AvailOutlet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailOutletImplCopyWith<_$AvailOutletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
