import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

DateTime dateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

String dateDay(String date) {
  DateTime parsedDate = DateTime.parse(date); 
  String formatted = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
  return formatted;
}

String dateDefault(String date) {
  DateTime parsedDate = DateTime.parse(date); 
  String formatted = DateFormat('yyyy-MM-dd', 'id_ID').format(parsedDate);
  return formatted;
}

String dateWithTime(String date) {
  DateTime parsedDate = DateTime.parse(date); 
  String formatted = DateFormat('yyyy-MM-dd HH:mm:ss', 'id_ID').format(parsedDate);
  return formatted;
}

String numberFormat([String currency = 'IDR', dynamic x = 0]) {
  final numValue = x is num ? x : num.tryParse(x.toString());
  final formatted = NumberFormat.currency(locale: 'in', decimalDigits: 0).format(numValue ?? 0).replaceAll('IDR', '').trim();
  
  return '$currency $formatted';
}

String firstName(String fullName) {
  if (fullName.trim().isEmpty) return '';
  return fullName.trim().split(' ').first;
}

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat("#,###", "id_ID");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    // Hapus karakter non-digit dulu
    String newText = newValue.text.replaceAll('.', '');
    // Ubah ke format dengan titik pemisah ribuan
    String formattedText = _formatter.format(int.parse(newText));
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

extension CapitalizeExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

int bulatkanKe500(int harga) {
  return ((harga + 499) ~/ 500) * 500;
}

String formatTwoColumnText(String left, String right, {int width = 32}) {
  int space = width - left.length - right.length;

  if (space < 0) space = 1;

  return '$left${' ' * space}$right';
}

String numberFormatNoIDR(x) {
  return NumberFormat.currency(locale: 'in', decimalDigits: 0).format(x).replaceAll('IDR', '');
}