// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_transaction_sm_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSMDetailModelImpl _$$TransactionSMDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSMDetailModelImpl(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : TransactionSMHeaderData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionSMDetailModelImplToJson(
        _$TransactionSMDetailModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$TransactionSMHeaderDataImpl _$$TransactionSMHeaderDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSMHeaderDataImpl(
      transactionID: (json['TransactionID'] as num?)?.toInt(),
      transactionNumber: json['TransactionNumber'] as String?,
      datetime: json['Datetime'] as String?,
      tableID: json['TableID'] as String?,
      tableNumber: json['TableNumber'] as String?,
      tableLabel: json['TableLabel'] as String?,
      transactionType: json['TransactionType'] as String?,
      customerID: json['CustomerID'] as String?,
      customerName: json['CustomerName'] as String?,
      ppn: (json['PPN'] as num?)?.toInt(),
      rounding: (json['Rounding'] as num?)?.toInt(),
      subTotal: (json['SubTotal'] as num?)?.toInt(),
      grandTotalFinal: (json['GrandTotalFinal'] as num?)?.toInt(),
      uniqueNumber: (json['UniqeNumber'] as num?)?.toInt(),
      statusTransaction: json['StatusTransaction'] as String?,
      urlQRCode: json['UrlQrCode'] as String?,
      details: (json['Details'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionSMDetailData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionSMHeaderDataImplToJson(
        _$TransactionSMHeaderDataImpl instance) =>
    <String, dynamic>{
      'TransactionID': instance.transactionID,
      'TransactionNumber': instance.transactionNumber,
      'Datetime': instance.datetime,
      'TableID': instance.tableID,
      'TableNumber': instance.tableNumber,
      'TableLabel': instance.tableLabel,
      'TransactionType': instance.transactionType,
      'CustomerID': instance.customerID,
      'CustomerName': instance.customerName,
      'PPN': instance.ppn,
      'Rounding': instance.rounding,
      'SubTotal': instance.subTotal,
      'GrandTotalFinal': instance.grandTotalFinal,
      'UniqeNumber': instance.uniqueNumber,
      'StatusTransaction': instance.statusTransaction,
      'UrlQrCode': instance.urlQRCode,
      'Details': instance.details,
    };

_$TransactionSMDetailDataImpl _$$TransactionSMDetailDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSMDetailDataImpl(
      cartID: (json['CartID'] as num?)?.toInt(),
      cartDetailID: (json['CartDetailID'] as num?)?.toInt(),
      menuID: (json['MenuID'] as num?)?.toInt(),
      menuName: json['MenuName'] as String?,
      parentID: (json['ParentID'] as num?)?.toInt(),
      sendOrder: (json['SendOrder'] as num?)?.toInt(),
      notes: json['Notes'] as String?,
      menuImage: json['MenuImage'] as String?,
      qty: (json['Qty'] as num?)?.toInt(),
      menuPrice: (json['MenuPrice'] as num?)?.toInt(),
      discountDetail: json['DiscountDetail'] as List<dynamic>? ?? const [],
      totalPriceItem: (json['TotalPriceItem'] as num?)?.toInt(),
      printKitchen: (json['PrintKitchen'] as num?)?.toInt(),
      stationID: (json['StationID'] as num?)?.toInt(),
      addOn: (json['addOn'] as List<dynamic>?)
              ?.map((e) => AddOn.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionSMDetailDataImplToJson(
        _$TransactionSMDetailDataImpl instance) =>
    <String, dynamic>{
      'CartID': instance.cartID,
      'CartDetailID': instance.cartDetailID,
      'MenuID': instance.menuID,
      'MenuName': instance.menuName,
      'ParentID': instance.parentID,
      'SendOrder': instance.sendOrder,
      'Notes': instance.notes,
      'MenuImage': instance.menuImage,
      'Qty': instance.qty,
      'MenuPrice': instance.menuPrice,
      'DiscountDetail': instance.discountDetail,
      'TotalPriceItem': instance.totalPriceItem,
      'PrintKitchen': instance.printKitchen,
      'StationID': instance.stationID,
      'addOn': instance.addOn,
    };

_$AddOnImpl _$$AddOnImplFromJson(Map<String, dynamic> json) => _$AddOnImpl(
      menuId: (json['MenuID'] as num?)?.toInt(),
      menuName: json['MenuName'] as String?,
      sendOrder: (json['SendOrder'] as num?)?.toInt(),
      notes: json['Notes'] as String?,
      menuImage: json['MenuImage'] as String?,
      qty: (json['Qty'] as num?)?.toInt(),
      menuPrice: (json['MenuPrice'] as num?)?.toInt(),
      printKitchen: (json['PrintKitchen'] as num?)?.toInt(),
      stationID: (json['StationID'] as num?)?.toInt(),
      discountDetail: json['DiscountDetail'] as List<dynamic>? ?? const [],
      totalPriceItem: (json['TotalPriceItem'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddOnImplToJson(_$AddOnImpl instance) =>
    <String, dynamic>{
      'MenuID': instance.menuId,
      'MenuName': instance.menuName,
      'SendOrder': instance.sendOrder,
      'Notes': instance.notes,
      'MenuImage': instance.menuImage,
      'Qty': instance.qty,
      'MenuPrice': instance.menuPrice,
      'PrintKitchen': instance.printKitchen,
      'StationID': instance.stationID,
      'DiscountDetail': instance.discountDetail,
      'TotalPriceItem': instance.totalPriceItem,
    };
