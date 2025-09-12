class UTransactionLite {
  final String transactionNumber;
  final String statusTransaction;
  final String paymentMethod;
  final int subTotal;
  final int discountTotal;
  final String discountOnDetail;
  final int grandTotalBeforeTax;
  final int ppn;
  final int grandTotalAfterTax;
  final int rounding;
  final int grandTotalFinal;
  final int transactionTypeJuncID;

  const UTransactionLite({
    required this.transactionNumber,
    required this.statusTransaction,
    required this.paymentMethod,
    required this.subTotal,
    required this.discountTotal,
    required this.discountOnDetail,
    required this.grandTotalBeforeTax,
    required this.ppn,
    required this.grandTotalAfterTax,
    required this.rounding,
    required this.grandTotalFinal,
    required this.transactionTypeJuncID,
  });

  factory UTransactionLite.fromMap(Map<String, dynamic> json) {
    return UTransactionLite(
      transactionNumber: json['transactionNumber'],
      statusTransaction: json['statusTransaction'],
      paymentMethod: json['paymentMethod'],
      subTotal: json['subTotal'],
      discountTotal: json['discountTotal'],
      discountOnDetail: json['discountOnDetail'],
      grandTotalBeforeTax: json['grandTotalBeforeTax'],
      ppn: json['ppn'],
      grandTotalAfterTax: json['grandTotalAfterTax'],
      rounding: json['rounding'],
      grandTotalFinal: json['grandTotalFinal'],
      transactionTypeJuncID: json['transactionTypeJuncID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionNumber': transactionNumber,
      'statusTransaction': statusTransaction,
      'paymentMethod': paymentMethod,
      'subTotal': subTotal,
      'discountTotal': discountTotal,
      'discountOnDetail': discountOnDetail,
      'grandTotalBeforeTax': grandTotalBeforeTax,
      'ppn': ppn,
      'grandTotalAfterTax': grandTotalAfterTax,
      'rounding': rounding,
      'grandTotalFinal': grandTotalFinal,
      'transactionTypeJuncID': transactionTypeJuncID,
    };
  }
}
