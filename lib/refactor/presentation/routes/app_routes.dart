abstract class RouteName {
  // :: Splash Screen
  static const splash = '/';

  // :: Auth Screen
  static const signIn = '/sign-in';
  static const screenLock = '/screen-lock';

  // :: Home Screen
  static const topNavigation = '/top-navigation';

  // :: Transaction Screen
  static const transactionReport = '/home/transaction-report';

  // :: Order Screen
  static const orderSM = '/home/order-smenu';
  static const checkOutSM = '/home/order-smenu/check-out-smenu';
  static const successPaymentSM =
      '/home/order-smenu/check-out-smenu/success-payment';
  static const orderOffline = '/home/order-offline';

  // :: Report Summary
  static const reportSummary = '/home/report-summary';

  // :: Payment Success Screen
  static const successPaymentOffline = '/home/order/check-out/success-payment';
}
