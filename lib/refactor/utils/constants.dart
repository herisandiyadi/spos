import 'package:flutter/material.dart';

enum TransactionFilter { all, open, close, smenu }

// :: Type create customer
const int all = 1;
const int tad = 2;

// :: Type print summary report
const String payments = "payment_method";
const String products = "product_sold";

// :: Type error network exception
const String socketException = "socket_exception";
const String httpException = "http_exception";
const String formatException = "format_exception";
const String timeOutException = "time_out_exception";
const String unknownException = "unknown_exception";

// :: Colors custom
const Color primaryColor = Color(0xFF7851A9);

const Color customRed1 = Color(0xFFF11F3E);
const Color customRed2 = Color(0xFFC5447E);
const Color customWhite1 = Color(0xFFF8F8FF);
const Color customWhite2 = Color(0xFFF8F8Fe);
const Color customWhite3 = Color(0xFFE2E4F1);
const Color customBlack = Color(0xFF2F333E);
const Color customGrey1 = Color(0xFF585858);
const Color customGrey2 = Color(0xFFCCCCCC);
const Color customDarkGrey = Color(0xFFEBEBEB);
const Color customLightGrey = Color(0xFFF5F5F5);
const Color customRegularGrey = Color(0xFFD7D7D7);
const Color customBlue1 = Color(0xFF294C68);
const Color customBlue2 = Color(0xFF23C0E6);
const Color customGreen = Color(0xFF44C593);
const Color customYellow = Color(0xFFFCE340);

const Color customHeadingText = Color(0xFF8B8A8D);
const Color customBodyText = Color(0xFF585858);
const Color customButtonText = Color(0xFFEBEBEB);
const Color customBackground = Color(0xFFF5F5F5);
const Color customOccupied = Color(0xFFC5447E);
const Color customBilled = Color(0xFF44C593);
const Color customOrderSend = Color(0xFFDEA556);

// :: Category POS
const String offline = "offline";
const String smenu = "smenu";

// :: Type filter report summary
const String today = "D";
const String oneWeek = "W";
const String oneMonth = "M";

// :: Type sync data
const String allData = "all";
const String getLocation = "getLocation";
const String getStation = "getStation";
const String getTable = "getTable";
const String getCategory = "getCategory";
const String getMenu = "getMenu";
const String getDiscount = "getDiscount";
const String getPaymentMethod = "getPaymentMethod";
const String getProvince = "getProvince";
const String getCity = "getCity";
const String getCustomer = "getCustomer";
const String getTransactionType = "getTransactionTypeJuncLite";
const String getTax = "getTax";
