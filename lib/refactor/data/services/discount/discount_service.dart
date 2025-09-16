import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/discount/discount_model.dart';

class DiscountService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<DiscountModel>> getDiscountToday(String today) async {
    final result = await _dbHelper.getDiscountToday(today);
    return result.map((e) => DiscountModel.fromJson(e)).toList();
  }

  Future<List<DiscountModel>> getDiscountByTypeAndDay(
      String today, int discountType) async {
    final db = await _dbHelper.database;
    final query = await db.rawQuery('''
      SELECT * from DiscountLite
      WHERE availableDay LIKE ? AND discountType = ?
      ''', ['%"$today"%', discountType]);
    return query.map((e) => DiscountModel.fromJson(e)).toList();
  }
}
