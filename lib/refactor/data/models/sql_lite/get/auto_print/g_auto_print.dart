import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_auto_print.freezed.dart';
part 'g_auto_print.g.dart';

@freezed
class AutoPrintModel with _$AutoPrintModel {
  const factory AutoPrintModel({
    required bool isAutoPrint,
  }) = _AutoPrintModel;

  factory AutoPrintModel.fromJson(Map<String, dynamic> json) =>
      _$AutoPrintModelFromJson(json);
}

// SQLite helper functions (to be used in DatabaseHelper)
class AutoPrintSqliteHelper {
  static const String tableName = 'AutoPrint';

  static String createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      isAutoPrint INTEGER NOT NULL
    )
  ''';

  // Convert model to SQLite map
  static Map<String, dynamic> toMap(AutoPrintModel model) {
    return {
      'isAutoPrint': model.isAutoPrint ? 1 : 0,
    };
  }

  // Convert SQLite map to model
  static AutoPrintModel fromMap(Map<String, dynamic> map) {
    return AutoPrintModel(
      isAutoPrint: map['isAutoPrint'] == 1,
    );
  }
}
