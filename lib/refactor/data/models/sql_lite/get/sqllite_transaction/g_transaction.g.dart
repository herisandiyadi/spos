// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionLiteModelImpl _$$TransactionLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionLiteModelImpl(
      transactionID: (json['transactionID'] as num).toInt(),
      transactionNumber: json['transactionNumber'] as String?,
      datetime: json['datetime'] as String?,
      outletName: json['outletName'] as String?,
      customerID: (json['customerID'] as num).toInt(),
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      tableID: (json['tableID'] as num).toInt(),
      tableLabel: json['tableLabel'] as String?,
      guestNumber: (json['guestNumber'] as num).toInt(),
      transactionType: json['transactionType'] as String?,
      subTotal: (json['subTotal'] as num).toInt(),
      discountTotal: (json['discountTotal'] as num).toInt(),
      discountOnDetail:
          const ListMapConverter().fromJson(json['discountOnDetail']),
      discountOnTrans:
          const ListMapConverter().fromJson(json['discountOnTrans']),
      grandTotalBeforeTax: (json['grandTotalBeforeTax'] as num).toInt(),
      ppn: (json['ppn'] as num).toInt(),
      ppnName: json['ppnName'] as String?,
      serviceCharge: (json['serviceCharge'] as num).toInt(),
      packageNService: (json['packageNService'] as num).toInt(),
      grandTotalAfterTax: (json['grandTotalAfterTax'] as num).toInt(),
      rounding: (json['rounding'] as num).toInt(),
      grandTotalFinal: (json['grandTotalFinal'] as num).toInt(),
      posLoginID: (json['posLoginID'] as num).toInt(),
      closeBillStaffID: (json['closeBillStaffID'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String?,
      statusTransaction: json['statusTransaction'] as String?,
      statusSync: (json['statusSync'] as num).toInt(),
      statusReceipt: (json['statusReceipt'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionLiteModelImplToJson(
        _$TransactionLiteModelImpl instance) =>
    <String, dynamic>{
      'transactionID': instance.transactionID,
      'transactionNumber': instance.transactionNumber,
      'datetime': instance.datetime,
      'outletName': instance.outletName,
      'customerID': instance.customerID,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'tableID': instance.tableID,
      'tableLabel': instance.tableLabel,
      'guestNumber': instance.guestNumber,
      'transactionType': instance.transactionType,
      'subTotal': instance.subTotal,
      'discountTotal': instance.discountTotal,
      'discountOnDetail':
          const ListMapConverter().toJson(instance.discountOnDetail),
      'discountOnTrans':
          const ListMapConverter().toJson(instance.discountOnTrans),
      'grandTotalBeforeTax': instance.grandTotalBeforeTax,
      'ppn': instance.ppn,
      'ppnName': instance.ppnName,
      'serviceCharge': instance.serviceCharge,
      'packageNService': instance.packageNService,
      'grandTotalAfterTax': instance.grandTotalAfterTax,
      'rounding': instance.rounding,
      'grandTotalFinal': instance.grandTotalFinal,
      'posLoginID': instance.posLoginID,
      'closeBillStaffID': instance.closeBillStaffID,
      'paymentMethod': instance.paymentMethod,
      'statusTransaction': instance.statusTransaction,
      'statusSync': instance.statusSync,
      'statusReceipt': instance.statusReceipt,
    };
