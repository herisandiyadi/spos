import 'package:intl/intl.dart';

class DateFormatter {
  // :: Format a DateTime into string using pattern and optional locale
  static String format({required DateTime date, required String pattern, String locale = 'en_US'}) {
    return DateFormat(pattern, locale).format(date);
  }

  // :: Parse a string into DateTime using input format
  static DateTime? parse({required String input, required String pattern, String locale = 'en_US'}) {
    try {
      return DateFormat(pattern, locale).parseStrict(input);
    } catch (_) {
      return null;
    }
  }

  /// Convert date string from one pattern to another
  static String? reformat({required String input, required String fromPattern, required String toPattern, String locale = 'en_US'}) {
    final date = parse(input: input, pattern: fromPattern, locale: locale);

    if (date == null) return null;
    
    return format(date: date, pattern: toPattern, locale: locale);
  }

  /// Common patterns (can be extended)
  static const String fullDateTime = 'yyyy-MM-dd HH:mm:ss';
  static const String isoDate = 'yyyy-MM-dd';
  static const String isoDateTime = "yyyy-MM-dd'T'HH:mm:ss";
  static const String shortDate = 'dd/MM/yyyy';
  static const String shortDateDash = 'dd-MM-yyyy';
  static const String timeOnly = 'HH:mm:ss';
  static const String dayMonth = 'dd MMM';
  static const String fullDayMonth = 'dd MMMM yyyy';
  static const String dayName = 'EEEE';
}

