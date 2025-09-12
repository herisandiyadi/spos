import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart' as date_picker;
import 'package:squadra_pos/refactor/utils/constants.dart';

class ConfigCalendarAttendance {
  final Color selectedDayHighlightColor;
  final List<String> weekdayLabels;
  final TextStyle weekdayLabelTextStyle;
  final int firstDayOfWeek;
  final TextStyle controlsTextStyle;
  final TextStyle dayTextStyle;
  final TextStyle disabledDayTextStyle;
  final date_picker.CalendarDatePicker2Type calendarType;
  final SelectableDayPredicate selectableDayPredicate;

  ConfigCalendarAttendance({
    required this.selectedDayHighlightColor,
    required this.weekdayLabels,
    required this.weekdayLabelTextStyle,
    required this.firstDayOfWeek,
    required this.controlsTextStyle,
    required this.dayTextStyle,
    required this.disabledDayTextStyle,
    required this.calendarType,
    required this.selectableDayPredicate,
  });

  factory ConfigCalendarAttendance.defaultConfig(BuildContext context) {
    return ConfigCalendarAttendance(
      selectedDayHighlightColor: primaryColor,
      weekdayLabels: ['M', 'S', 'S', 'R', 'K', 'J', 'S'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      calendarType: date_picker.CalendarDatePicker2Type.single,
      selectableDayPredicate: (day) => true,
    );
  }

  date_picker.CalendarDatePicker2WithActionButtonsConfig get config {
    return date_picker.CalendarDatePicker2WithActionButtonsConfig(
      selectedDayHighlightColor: selectedDayHighlightColor,
      weekdayLabels: weekdayLabels,
      weekdayLabelTextStyle: weekdayLabelTextStyle,
      firstDayOfWeek: firstDayOfWeek,
      controlsTextStyle: controlsTextStyle,
      dayTextStyle: dayTextStyle,
      disabledDayTextStyle: disabledDayTextStyle,
      calendarType: calendarType,
      selectableDayPredicate: selectableDayPredicate,

    );
  }
}
