// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailLiteModelImpl _$$TransactionDetailLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailLiteModelImpl(
      transactionDetailID: (json['transactionDetailID'] as num).toInt(),
      transactionNumber: json['transactionNumber'] as String,
      menuID: (json['menuID'] as num).toInt(),
      menuName: json['menuName'] as String,
      qty: (json['qty'] as num).toInt(),
      menuPrice: (json['menuPrice'] as num).toInt(),
      discountDetail: const ListMapConverter().fromJson(json['discountDetail']),
      menuPriceAfterDiscount: (json['menuPriceAfterDiscount'] as num).toInt(),
      noteOption: json['noteOption'] as String,
      notes: json['notes'] as String,
      parentID: (json['parentID'] as num?)?.toInt(),
      menuImage: json['menuImage'] as String,
      statusSend: (json['statusSend'] as num?)?.toInt(),
      stationID: (json['stationID'] as num?)?.toInt(),
      statusItem: json['statusItem'] as String,
      addOn: const ListMapConverter().fromJson(json['addOn']),
    );

Map<String, dynamic> _$$TransactionDetailLiteModelImplToJson(
        _$TransactionDetailLiteModelImpl instance) =>
    <String, dynamic>{
      'transactionDetailID': instance.transactionDetailID,
      'transactionNumber': instance.transactionNumber,
      'menuID': instance.menuID,
      'menuName': instance.menuName,
      'qty': instance.qty,
      'menuPrice': instance.menuPrice,
      'discountDetail':
          const ListMapConverter().toJson(instance.discountDetail),
      'menuPriceAfterDiscount': instance.menuPriceAfterDiscount,
      'noteOption': instance.noteOption,
      'notes': instance.notes,
      'parentID': instance.parentID,
      'menuImage': instance.menuImage,
      'statusSend': instance.statusSend,
      'stationID': instance.stationID,
      'statusItem': instance.statusItem,
      'addOn': const ListMapConverter().toJson(instance.addOn),
    };
