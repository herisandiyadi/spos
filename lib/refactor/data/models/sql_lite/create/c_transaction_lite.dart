class TransactionLiteCreate {
  final String? transactionNumber;
  final String? datetime;
  final String? outletName;
  final int customerID;
  final String? customerName;
  final int tableID;
  final int guestNumber;
  final String? transactionType;
  final int subTotal;
  final int discountTotal;
  final String? discountOnTrans;
  final String? discountOnDetail;
  final int grandTotalBeforeTax;
  final int ppn;
  final String? ppnName;
  final int serviceCharge;
  final int packageNService;
  final int grandTotalAfterTax;
  final int rounding;
  final int grandTotalFinal;
  final int posLoginID;
  final int closeBillStaffID;
  final String? paymentMethod;
  final String? statusTransaction;
  final int statusSync;
  final int statusReceipt;
  final String? closeDate;

  const TransactionLiteCreate(
      {this.transactionNumber,
      this.datetime,
      this.outletName,
      required this.customerID,
      this.customerName,
      required this.tableID,
      required this.guestNumber,
      this.transactionType,
      required this.subTotal,
      required this.discountTotal,
      this.discountOnTrans,
      this.discountOnDetail,
      required this.grandTotalBeforeTax,
      required this.ppn,
      required this.ppnName,
      required this.serviceCharge,
      required this.packageNService,
      required this.grandTotalAfterTax,
      required this.rounding,
      required this.grandTotalFinal,
      required this.posLoginID,
      required this.closeBillStaffID,
      this.paymentMethod,
      this.statusTransaction,
      required this.statusSync,
      required this.statusReceipt,
      this.closeDate});

  Map<String, dynamic> toMap() => {
        'transactionNumber': transactionNumber,
        'datetime': datetime,
        'outletName': outletName,
        'customerID': customerID,
        'customerName': customerName,
        'tableID': tableID,
        'guestNumber': guestNumber,
        'transactionType': transactionType,
        'subTotal': subTotal,
        'discountTotal': discountTotal,
        'discountOnTrans': discountOnTrans,
        'discountOnDetail': discountOnDetail,
        'grandTotalBeforeTax': grandTotalBeforeTax,
        'ppn': ppn,
        'ppnName': ppnName,
        'serviceCharge': serviceCharge,
        'packageNService': packageNService,
        'grandTotalAfterTax': grandTotalAfterTax,
        'rounding': rounding,
        'grandTotalFinal': grandTotalFinal,
        'posLoginID': posLoginID,
        'closeBillStaffID': closeBillStaffID,
        'paymentMethod': paymentMethod,
        'statusTransaction': statusTransaction,
        'statusSync': statusSync,
        'statusReceipt': statusReceipt,
        'closeDate': closeDate,
      };
}
