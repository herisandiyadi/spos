class TransDetailLiteCreate {
  final String? transactionNumber;
  final int menuID;
  final String? menuName;
  final int qty;
  final int menuPrice;
  final String? discountDetail;
  final int menuPriceAfterDiscount;
  final String? noteOption;
  final int parentID;
  final String? menuImage;
  final int statusSend;
  final String? notes;
  final String? statusItem;

  const TransDetailLiteCreate({
    this.transactionNumber,
    required this.menuID,
    this.menuName,
    required this.qty,
    required this.menuPrice,
    this.discountDetail,
    required this.menuPriceAfterDiscount,
    this.noteOption,
    required this.parentID,
    this.menuImage,
    required this.statusSend,
    this.notes,
    this.statusItem,
  });

  factory TransDetailLiteCreate.fromJson(Map<String, dynamic> json) {
    return TransDetailLiteCreate(
      transactionNumber: json['transactionNumber'],
      menuID: json['menuID'],
      menuName: json['menuName'],
      qty: json['qty'],
      menuPrice: json['menuPrice'],
      discountDetail: json['discountDetail'],
      menuPriceAfterDiscount: json['menuPriceAfterDiscount'],
      noteOption: json['noteOption'],
      parentID: json['parentID'],
      menuImage: json['menuImage'],
      statusSend: json['statusSend'],
      notes: json['notes'],
      statusItem: json['statusItem'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionNumber': transactionNumber,
      'menuID': menuID,
      'menuName': menuName,
      'qty': qty,
      'menuPrice': menuPrice,
      'discountDetail': discountDetail,
      'menuPriceAfterDiscount': menuPriceAfterDiscount,
      'noteOption': noteOption,
      'parentID': parentID,
      'menuImage': menuImage,
      'statusSend': statusSend,
      'notes': notes,
      'statusItem': statusItem
    };
  }
}
