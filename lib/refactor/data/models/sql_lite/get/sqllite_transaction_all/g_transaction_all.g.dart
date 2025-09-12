// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_transaction_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionLiteAllModelImpl _$$TransactionLiteAllModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionLiteAllModelImpl(
      transactionID: (json['transactionID'] as num).toInt(),
      transactionNumber: json['transactionNumber'] as String,
      datetime: json['datetime'] as String,
      outletName: json['outletName'] as String,
      customerID: (json['customerID'] as num).toInt(),
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String,
      tableID: (json['tableID'] as num).toInt(),
      guestNumber: (json['guestNumber'] as num).toInt(),
      transactionType: json['transactionType'] as String,
      transactionTypeJuncID: (json['transactionTypeJuncID'] as num).toInt(),
      subTotal: (json['subTotal'] as num).toInt(),
      discountTotal: (json['discountTotal'] as num).toInt(),
      discountOnTrans:
          const ListMapConverter().fromJson(json['discountOnTrans']),
      discountOnDetail:
          const ListMapConverter().fromJson(json['discountOnDetail']),
      grandTotalBeforeTax: (json['grandTotalBeforeTax'] as num).toInt(),
      ppn: (json['ppn'] as num).toInt(),
      serviceCharge: (json['serviceCharge'] as num).toInt(),
      packageNService: (json['packageNService'] as num).toInt(),
      grandTotalAfterTax: (json['grandTotalAfterTax'] as num).toInt(),
      rounding: (json['rounding'] as num).toInt(),
      grandTotalFinal: (json['grandTotalFinal'] as num).toInt(),
      posLoginID: (json['posLoginID'] as num).toInt(),
      closeBillStaffID: (json['closeBillStaffID'] as num).toInt(),
      paymentMethod: const ListMapConverter().fromJson(json['paymentMethod']),
      statusTransaction: json['statusTransaction'] as String,
      statusSync: (json['statusSync'] as num).toInt(),
      appVersion: json['appVersion'] as String?,
      closeDate: json['closeDate'] as String,
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionLiteAllModelImplToJson(
        _$TransactionLiteAllModelImpl instance) =>
    <String, dynamic>{
      'transactionID': instance.transactionID,
      'transactionNumber': instance.transactionNumber,
      'datetime': instance.datetime,
      'outletName': instance.outletName,
      'customerID': instance.customerID,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'tableID': instance.tableID,
      'guestNumber': instance.guestNumber,
      'transactionType': instance.transactionType,
      'transactionTypeJuncID': instance.transactionTypeJuncID,
      'subTotal': instance.subTotal,
      'discountTotal': instance.discountTotal,
      'discountOnTrans':
          const ListMapConverter().toJson(instance.discountOnTrans),
      'discountOnDetail':
          const ListMapConverter().toJson(instance.discountOnDetail),
      'grandTotalBeforeTax': instance.grandTotalBeforeTax,
      'ppn': instance.ppn,
      'serviceCharge': instance.serviceCharge,
      'packageNService': instance.packageNService,
      'grandTotalAfterTax': instance.grandTotalAfterTax,
      'rounding': instance.rounding,
      'grandTotalFinal': instance.grandTotalFinal,
      'posLoginID': instance.posLoginID,
      'closeBillStaffID': instance.closeBillStaffID,
      'paymentMethod': const ListMapConverter().toJson(instance.paymentMethod),
      'statusTransaction': instance.statusTransaction,
      'statusSync': instance.statusSync,
      'appVersion': instance.appVersion,
      'closeDate': instance.closeDate,
      'details': instance.details,
    };

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      transactionDetailID: (json['transactionDetailID'] as num?)?.toInt(),
      transactionNumber: json['transactionNumber'] as String?,
      menuID: (json['menuID'] as num?)?.toInt(),
      menuName: json['menuName'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      menuPrice: (json['menuPrice'] as num?)?.toInt(),
      discountDetail: const ListMapConverter().fromJson(json['discountDetail']),
      addOn: const ListMapConverter().fromJson(json['addOn']),
      menuPriceAfterDiscount: (json['menuPriceAfterDiscount'] as num?)?.toInt(),
      noteOption: json['noteOption'] as String?,
      parentID: (json['parentID'] as num?)?.toInt(),
      menuImage: json['menuImage'] as String?,
      statusSend: (json['statusSend'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      stationID: (json['stationID'] as num?)?.toInt(),
      statusItem: json['statusItem'] as String?,
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'transactionDetailID': instance.transactionDetailID,
      'transactionNumber': instance.transactionNumber,
      'menuID': instance.menuID,
      'menuName': instance.menuName,
      'qty': instance.qty,
      'menuPrice': instance.menuPrice,
      'discountDetail':
          const ListMapConverter().toJson(instance.discountDetail),
      'addOn': const ListMapConverter().toJson(instance.addOn),
      'menuPriceAfterDiscount': instance.menuPriceAfterDiscount,
      'noteOption': instance.noteOption,
      'parentID': instance.parentID,
      'menuImage': instance.menuImage,
      'statusSend': instance.statusSend,
      'notes': instance.notes,
      'stationID': instance.stationID,
      'statusItem': instance.statusItem,
    };
