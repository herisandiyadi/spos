// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_transaction_detail_close.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailCloseLiteModelImpl
    _$$TransactionDetailCloseLiteModelImplFromJson(Map<String, dynamic> json) =>
        _$TransactionDetailCloseLiteModelImpl(
          transactionDetailID: (json['transactionDetailID'] as num).toInt(),
          datetime: json['datetime'] as String,
          transactionNumber: json['transactionNumber'] as String,
          menuID: (json['menuID'] as num).toInt(),
          menuName: json['menuName'] as String,
          totalQty: (json['totalQty'] as num).toInt(),
          totalPrice: (json['totalPrice'] as num).toInt(),
          discountDetail:
              const ListMapConverter().fromJson(json['discountDetail']),
          menuPriceAfterDiscount:
              (json['menuPriceAfterDiscount'] as num).toInt(),
          noteOption: json['noteOption'] as String,
          parentID: (json['parentID'] as num?)?.toInt(),
          menuImage: json['menuImage'] as String,
          statusSend: (json['statusSend'] as num?)?.toInt(),
          stationID: (json['stationID'] as num?)?.toInt(),
          addOn: const ListMapConverter().fromJson(json['addOn']),
        );

Map<String, dynamic> _$$TransactionDetailCloseLiteModelImplToJson(
        _$TransactionDetailCloseLiteModelImpl instance) =>
    <String, dynamic>{
      'transactionDetailID': instance.transactionDetailID,
      'datetime': instance.datetime,
      'transactionNumber': instance.transactionNumber,
      'menuID': instance.menuID,
      'menuName': instance.menuName,
      'totalQty': instance.totalQty,
      'totalPrice': instance.totalPrice,
      'discountDetail':
          const ListMapConverter().toJson(instance.discountDetail),
      'menuPriceAfterDiscount': instance.menuPriceAfterDiscount,
      'noteOption': instance.noteOption,
      'parentID': instance.parentID,
      'menuImage': instance.menuImage,
      'statusSend': instance.statusSend,
      'stationID': instance.stationID,
      'addOn': const ListMapConverter().toJson(instance.addOn),
    };
