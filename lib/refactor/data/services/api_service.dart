class ApiEndPoints {
  static String firstVersion = "/squadrapos/api/v1/";
  // :: Sign In
  static String login = '${firstVersion}login';
  // :: Transaction report
  static String transactionReport = '${firstVersion}TransactionReport';
  // :: Transaction smenu
  static String transactionSM = '${firstVersion}TransactionSmenu';
  static String transactionDetailSM =
      '${firstVersion}TransactionSmenuDetail/:id';
  static String cartAddSM = '${firstVersion}AddToCartSmenu';
  static String cartRemoveSM = '${firstVersion}RemoveSmenuItem/:id';
  static String cartUpdateSM = '${firstVersion}UpdateSmenuItem';
  static String cartClearSM = '${firstVersion}RemoveSmenuAllItem/:id';
  static String orderSendSM = '${firstVersion}SendOrderSmenuItem';
  static String checkOutSM = '${firstVersion}CloseTransactionSmenu';
  static String updatePrintSM = '${firstVersion}UpdatePrintKitchen/:id';
  static String createLogAct = '${firstVersion}CreateLogAct';
  // :: Master Data
  static String menu = '${firstVersion}menu';
  static String tax = '${firstVersion}taxes';
  static String city = '${firstVersion}city';
  static String table = '${firstVersion}table';
  static String station = '${firstVersion}station';
  static String discount = '${firstVersion}discount';
  static String location = '${firstVersion}location';
  static String province = '${firstVersion}province';
  static String customer = '${firstVersion}customer';
  static String category = '${firstVersion}category';
  static String paymentMethod = '${firstVersion}paymethod';
  static String transactionType = '${firstVersion}transaction-type';
  // :: Create Customer
  static String createCustomer = '${firstVersion}create-customer';
  // :: Insert to Transaction Close
  static String createTransactionClose =
      '${firstVersion}close-transaction-offline-latest';
  // :: Create Transaction SMenu
  static String createTransactionSM = '${firstVersion}getQrcodeTable';
}
