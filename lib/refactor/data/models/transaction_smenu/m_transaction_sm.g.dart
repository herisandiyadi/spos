// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_transaction_sm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSMModelImpl _$$TransactionSMModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSMModelImpl(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => TransactionSMData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionSMModelImplToJson(
        _$TransactionSMModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$TransactionSMDataImpl _$$TransactionSMDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSMDataImpl(
      transactionID: (json['TransactionID'] as num?)?.toInt(),
      transactionNumber: json['TransactionNumber'] as String?,
      urlQRCode: json['UrlQrCode'] as String?,
      datetime: json['Datetime'] as String?,
      tableNumber: json['TableNumber'] as String?,
      tableID: json['TableID'] as String?,
      tableLabel: json['TableLabel'] as String?,
      transactionType: json['TransactionType'] as String?,
      customerID: json['CustomerID'],
      customerName: json['CustomerName'] as String?,
      ppn: (json['PPN'] as num?)?.toInt(),
      rounding: (json['Rounding'] as num?)?.toInt(),
      subTotal: (json['SubTotal'] as num?)?.toInt(),
      grandTotalFinal: (json['GrandTotalFinal'] as num?)?.toInt(),
      uniqeNumber: _toNum(json['UniqeNumber']),
      statusTransaction: json['StatusTransaction'] as String?,
    );

Map<String, dynamic> _$$TransactionSMDataImplToJson(
        _$TransactionSMDataImpl instance) =>
    <String, dynamic>{
      'TransactionID': instance.transactionID,
      'TransactionNumber': instance.transactionNumber,
      'UrlQrCode': instance.urlQRCode,
      'Datetime': instance.datetime,
      'TableNumber': instance.tableNumber,
      'TableID': instance.tableID,
      'TableLabel': instance.tableLabel,
      'TransactionType': instance.transactionType,
      'CustomerID': instance.customerID,
      'CustomerName': instance.customerName,
      'PPN': instance.ppn,
      'Rounding': instance.rounding,
      'SubTotal': instance.subTotal,
      'GrandTotalFinal': instance.grandTotalFinal,
      'UniqeNumber': instance.uniqeNumber,
      'StatusTransaction': instance.statusTransaction,
    };
