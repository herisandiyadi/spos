import 'dart:math';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/create/c_transaction_lite.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/create/c_transaction_detail_lite.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_category/g_category.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_city/g_city.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_customer/g_customer.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_location/g_location.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_menu/g_menu.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_province/g_province.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_tax/g_tax.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';

class DatabaseHelper {
  static final _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  final localStorage = Get.find<LocalStorage>();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbDir = await getDatabasesPath();
    final dbPath = '$dbDir/app_database.db';

    return openDatabase(
      dbPath,
      version: 4,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
        // AutoPrint table for storing auto print boolean
        await db.execute('''
          CREATE TABLE IF NOT EXISTS AutoPrint (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            isAutoPrint INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE LocationLite (
            locationID INTEGER,
            outletID INTEGER,
            locationCode TEXT,
            locationLabel TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE StationLite (
            stationID INTEGER,
            stationName TEXT,
            outletID INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE TableLite (
            tableID INTEGER,
            locationID INTEGER,
            tableNumber INTEGER,
            tableLabel TEXT,
            seat INTEGER,
            outletID INTEGER,
            tableStatus TEXT,
            uniqueNumberSM INTEGER,
            dateTimeSM TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE TaxLite (
            taxID INTEGER,
            taxName INTEGER,
            taxPercent DOUBLE
          )
        ''');
        await db.execute('''
          CREATE TABLE CategoryLite (
            categoryID INTEGER PRIMARY KEY AUTOINCREMENT,
            categoryName TEXT,
            categoryImage TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE MenuLite (
            menuID INTEGER PRIMARY KEY AUTOINCREMENT,
            menuCode TEXT,
            menuImage TEXT,
            categoryID INTEGER,
            stationID INTEGER,
            menuName TEXT,
            menuDesc TEXT,
            menuPrice INTEGER,
            menuDiscount INTEGER,
            menuType TEXT,
            addOn TEXT,
            noteOption TEXT,
            arrange INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE TransLite (
            transactionID INTEGER PRIMARY KEY AUTOINCREMENT,
            transactionNumber TEXT,
            datetime TEXT,
            outletName TEXT,
            customerID INTEGER,
            customerCode TEXT DEFAULT NULL,
            customerName TEXT,
            tableID INTEGER,
            guestNumber INTEGER,
            transactionType TEXT,
            transactionTypeJuncID INTEGER,
            subTotal INTEGER,
            discountTotal INTEGER,
            discountOnTrans TEXT,
            discountOnDetail TEXT,
            grandTotalBeforeTax INTEGER,
            ppn INTEGER,
            ppnName String,
            serviceCharge INTEGER,
            packageNService INTEGER,
            grandTotalAfterTax INTEGER,
            rounding INTEGER,
            grandTotalFinal INTEGER,
            posLoginID INTEGER,
            closeBillStaffID INTEGER,
            paymentMethod TEXT,
            statusTransaction TEXT,
            statusSync INTEGER,
            statusReceipt INTEGER,
            closeDate TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE TransDetailLite (
            transactionDetailID INTEGER PRIMARY KEY AUTOINCREMENT,
            transactionNumber TEXT,
            menuID INTEGER,
            menuName TEXT,
            qty INTEGER,
            menuPrice INTEGER,
            discountDetail TEXT,
            menuPriceAfterDiscount INTEGER,
            noteOption TEXT,
            parentID INTEGER,
            menuImage TEXT,
            statusSend INTEGER,
            notes TEXT,
            statusItem TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE DiscountLite (
            masterDiscountID INTEGER PRIMARY KEY AUTOINCREMENT,
            masterDiscountName TEXT,
            discountType INTEGER,
            valueType TEXT,
            discountValue INTEGER,
            spesificMenuID TEXT,
            discountValidFrom TEXT,
            discountValidUntil TEXT,
            minTransDiscount INTEGER,
            outletID INTEGER,
            maxDiscount INTEGER,
            qtyDiscount INTEGER,
            availableDay TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE PaymentMethodLite (
            paymentMethodID INTEGER PRIMARY KEY AUTOINCREMENT,
            paymentMethodName TEXT,
            paymentFee REAL
          )
        ''');
        await db.execute('''
          CREATE TABLE TransactionTypeJuncLite (
            transactionTypeJuncID INTEGER PRIMARY KEY AUTOINCREMENT,
            transJuncName TEXT,
            transTypeID INTEGER,
            chargeType TEXT,
            chargeValue INTEGER,
            outletID INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE LogLite (
            logID INTEGER PRIMARY KEY AUTOINCREMENT,
            dateTime TEXT,
            transactionNumber TEXT,
            statusReturn TEXT,
            statusMessage TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE ActPOSLite (
            logID INTEGER PRIMARY KEY AUTOINCREMENT,
            userID INTEGER,
            datetime TEXT,
            activityType TEXT,
            reffID TEXT,
            activityDesc TEXT,
            ipAddress TEXT,
            deviceName TEXT,
            companyCode TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE ProvinceLite (
            provinceID INTEGER PRIMARY KEY AUTOINCREMENT,
            provinceName TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE CityLite (
            cityID INTEGER PRIMARY KEY AUTOINCREMENT,
            provinceID INTEGER,
            cityName TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE CustomerLite (
            customerID INTEGER PRIMARY KEY AUTOINCREMENT,
            customerCode TEXT,
            fullname TEXT,
            email TEXT,
            mobileNo TEXT,
            birthDate TEXT,
            provinceID INTEGER DEFAULT NULL,
            cityID INTEGER DEFAULT NULL,
            address TEXT,
            outletID INTEGER
          )
        ''');
      },
    );
  }

  // :: Auto Print Boolean
  Future<void> setAutoPrint(bool value) async {
    final db = await database;
    // If table is empty, insert. If exists, update.
    final result = await db.query('AutoPrint');
    if (result.isEmpty) {
      await db.insert('AutoPrint', {'isAutoPrint': value ? 1 : 0});
    } else {
      await db.update('AutoPrint', {'isAutoPrint': value ? 1 : 0},
          where: 'id = ?', whereArgs: [result.first['id']]);
    }
  }

  Future<bool> getAutoPrint() async {
    final db = await database;
    final result = await db.query('AutoPrint');
    if (result.isNotEmpty) {
      return result.first['isAutoPrint'] == 1;
    }
    // Default: false if not set
    return false;
  }

  Future<int> insertUser(String name, int age) async {
    final db = await database;

    return db.insert('users', {'name': name, 'age': age});
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;

    return db.query('users');
  }

  // :: Location
  Future<int> insertLocation(
      {int? locationID,
      int? outletID,
      String? locationCode,
      String? locationLabel}) async {
    final db = await database;

    var result = await db.insert('LocationLite', {
      'locationID': locationID,
      'outletID': outletID,
      'locationCode': locationCode,
      'locationLabel': locationLabel
    });

    return result;
  }

  Future<List<Map<String, dynamic>>> getLocation() async {
    final db = await database;

    return db.query('LocationLite');
  }

  Future<int> deleteLocation() async {
    final db = await database;

    return db.delete('LocationLite');
  }

  // :: Station
  Future<int> insertStation(
      {int? stationID, String? stationName, int? outletID}) async {
    final db = await database;

    var result = await db.insert('StationLite', {
      'stationID': stationID,
      'stationName': stationName,
      'outletID': outletID,
    });
    return result;
  }

  Future<List<Map<String, dynamic>>> getStation() async {
    final db = await database;

    return db.query('StationLite');
  }

  Future<int> deleteStation() async {
    final db = await database;

    return db.delete('StationLite');
  }

  Future<List<Map<String, dynamic>>> getTax() async {
    final db = await database;

    return db.query('TaxLite');
  }

  // :: Table
  Future<int> insertTable(
      {int? tableID,
      int? locationID,
      int? tableNumber,
      String? tableLabel,
      int? seat,
      int? outletID,
      String? tableStatus,
      int? uniqueNumberSM}) async {
    final db = await database;

    var result = await db.insert('TableLite', {
      'tableID': tableID,
      'locationID': locationID,
      'tableNumber': tableNumber,
      'tableLabel': tableLabel,
      'seat': seat,
      'outletID': outletID,
      'tableStatus': tableStatus,
      'uniqueNumberSM': uniqueNumberSM,
      'dateTimeSM': null
    });

    return result;
  }

  Future<List<Map<String, dynamic>>> getTable() async {
    final db = await database;

    var result = await db.rawQuery(''' SELECT 
      TableLite.*, 
      (SELECT datetime FROM TransLite 
       WHERE TransLite.tableID = TableLite.tableID 
       ORDER BY transactionID DESC LIMIT 1) AS datetime,
      (SELECT transactionNumber FROM TransLite 
       WHERE TransLite.tableID = TableLite.tableID 
       ORDER BY transactionID DESC LIMIT 1) AS transactionNumber,
      (SELECT statusTransaction FROM TransLite 
       WHERE TransLite.tableID = TableLite.tableID 
       ORDER BY transactionID DESC LIMIT 1) AS statusTransaction
      FROM TableLite
    ''');

    return result;
  }

  Future<List<Map<String, dynamic>>> getTablesByLocation(int locationID) async {
    final db = await database;

    final result = await db.rawQuery('''
      SELECT 
        t.*,
        (
          SELECT datetime 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS datetime,
        (
          SELECT transactionNumber 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS transactionNumber,
        (
          SELECT statusTransaction 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS statusTransaction
      FROM TableLite t
      WHERE t.locationID = ?
    ''', [locationID]);

    return result;
  }

  Future<List<Map<String, dynamic>>> getAllTablesByLocation() async {
    final db = await database;

    final result = await db.rawQuery('''
      SELECT 
        t.*, 
        l.locationLabel,
        l.outletID,
        l.locationCode,
        (
          SELECT datetime 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS datetime,
        (
          SELECT transactionNumber 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS transactionNumber,
        (
          SELECT statusTransaction 
          FROM TransLite 
          WHERE TransLite.tableID = t.tableID 
          ORDER BY transactionID DESC 
          LIMIT 1
        ) AS statusTransaction
      FROM TableLite t
      JOIN LocationLite l ON t.locationID = l.locationID
      ORDER BY t.locationID
    ''');

    return result;
  }

  Future<List<Map<String, dynamic>>> countTable(
      List<LocationLiteModel> parsedLocation) async {
    final db = await database;

    final locationIDs = parsedLocation.map((e) => e.locationID).join(',');

    final result = await db.rawQuery(''' SELECT 
      t.locationID,
      SUM(CASE 
        WHEN (tr.statusTransaction IS NULL OR tr.statusTransaction = 'Close') 
          AND t.uniqueNumberSM = 0 
        THEN 1 ELSE 0 END
      ) AS availableCount,
      SUM(CASE 
        WHEN tr.statusTransaction = 'Open' 
          OR IFNULL(t.uniqueNumberSM, 0) > 0 
        THEN 1 ELSE 0 END
      ) AS occupiedCount
      FROM TableLite t
      LEFT JOIN (
        SELECT tableID, statusTransaction
        FROM TransLite
        WHERE transactionID IN (
          SELECT MAX(transactionID) 
          FROM TransLite 
          GROUP BY tableID
        )
      ) tr ON tr.tableID = t.tableID
      WHERE t.locationID IN ($locationIDs)
      GROUP BY t.locationID
    ''');

    return result;
  }

  Future<int> updateTable(
      {required int tableID, required String tableStatus}) async {
    final db = await database;

    var result = db.update(
      'TableLite',
      {'tableStatus': tableStatus},
      where: 'tableID = ?',
      whereArgs: [tableID],
    );

    return result;
  }

  Future<int> updateUniqueNumberSM(
      int tableID, num uniqueNumberSM, String dateTime) async {
    final db = await database;

    return await db.update(
      'TableLite',
      {
        'uniqueNumberSM': uniqueNumberSM,
        'dateTimeSM': dateTime,
      },
      where: 'tableID = ?',
      whereArgs: [tableID],
    );
  }

  Future<void> deleteTable() async {
    final db = await database;

    await db.execute("DELETE FROM TableLite");
    await db.execute("DELETE FROM sqlite_sequence WHERE name='TableLite'");
  }

  // :: Tax
  Future<int> insertTax(
      {int? taxID, String? taxName, double? taxPercent}) async {
    final db = await database;

    var result = await db.insert('TaxLite', {
      'taxID': taxID,
      'taxName': taxName,
      'taxPercent': taxPercent,
    });
    return result;
  }

  Future<void> deleteTax() async {
    final db = await database;

    await db.execute("DELETE FROM TaxLite");
    await db.execute("DELETE FROM sqlite_sequence WHERE name='TaxLite'");
  }

  // :: Category
  Future<int> insertCategory(
      {int? categoryID, String? categoryName, String? categoryImage}) async {
    final db = await database;

    return db.insert(
        'CategoryLite',
        {
          'categoryID': categoryID,
          'categoryName': categoryName,
          'categoryImage': categoryImage
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CategoryLiteModel>> getCategory() async {
    final db = await database;

    final results = await db.query('CategoryLite');

    return results.map((json) => CategoryLiteModel.fromJson(json)).toList();
  }

  Future<int> deleteCategory() async {
    final db = await database;

    return db.delete('CategoryLite');
  }

  // :: Menu
  Future<int> insertMenu(
      {int? menuID,
      String? menuCode,
      String? menuImage,
      int? categoryID,
      int? stationID,
      String? menuName,
      String? menuDesc,
      int? menuPrice,
      int? menuDiscount,
      String? menuType,
      String? addOn,
      String? noteOption,
      int? arrange}) async {
    final db = await database;

    return db.insert(
        'MenuLite',
        {
          'menuID': menuID,
          'menuCode': menuCode,
          'menuImage': menuImage,
          'categoryID': categoryID,
          'stationID': stationID,
          'menuName': menuName,
          'menuDesc': menuDesc,
          'menuPrice': menuPrice,
          'menuDiscount': menuDiscount,
          'menuType': menuType,
          'addOn': addOn,
          'noteOption': noteOption,
          'arrange': arrange,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MenuLiteModel>> getMenu() async {
    final db = await database;

    final results = await db.query('MenuLite', orderBy: 'arrange ASC');

    return results.map((json) => MenuLiteModel.fromJson(json)).toList();
  }

  Future<List<Map<String, dynamic>>> getMenuSpecID(menuID) async {
    final db = await database;

    return db.query('MenuLite', where: 'menuID = ?', whereArgs: [menuID]);
  }

  Future<List<Map<String, dynamic>>> getMenuSeveralID(List<int> menuIDs) async {
    final db = await database;

    if (menuIDs.isEmpty) return [];

    String placeholders = List.filled(menuIDs.length, '?').join(', ');

    return db.query('MenuLite',
        where: 'menuID IN ($placeholders)', whereArgs: menuIDs);
  }

  Future<List<MenuLiteModel>> getMenuFiltered(
      {required int categoryId, required String keyword}) async {
    final db = await database;

    String where = '';
    List<dynamic> whereArgs = [];

    if (categoryId != 0) {
      where += 'categoryID = ?';
      whereArgs.add(categoryId);
    }

    if (keyword.isNotEmpty) {
      if (where.isNotEmpty) where += ' AND ';
      where += '(LOWER(menuName) LIKE ? OR LOWER(menuCode) LIKE ?)';
      whereArgs.add('%${keyword.toLowerCase()}%');
      whereArgs.add('%${keyword.toLowerCase()}%');
    }

    final results = await db.query('MenuLite',
        where: where.isNotEmpty ? where : null,
        whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
        orderBy: 'arrange ASC');

    return results.map((json) => MenuLiteModel.fromJson(json)).toList();
  }

  Future<int> deleteMenu() async {
    final db = await database;

    return db.delete('MenuLite');
  }

  // :: Transaction :: //
  Future<int> createTransaction(TransactionLiteCreate data) async {
    final db = await database;

    return db.insert('TransLite', data.toMap());
  }

  Future<List<Map<String, dynamic>>> getTransaction() async {
    final db = await database;
    final id = await localStorage.getPosLoginID();

    final query = await db.rawQuery('''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ?
      ORDER BY TransLite.transactionID DESC
    ''', [id]);

    return query;
  }

  Future<List<Map<String, dynamic>>> getTransactionByTrx(
      {required int trx}) async {
    final db = await database;
    final id = await localStorage.getPosLoginID();

    final query = await db.rawQuery('''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ?
      AND transactionNumber = ?
      ORDER BY TransLite.transactionID DESC
    ''', [id, trx]);

    return query;
  }

  Future<List<Map<String, dynamic>>> getTransactionByDate(
      {required String startDate, required String endDate}) async {
    final db = await database;
    final id = await localStorage.getPosLoginID();

    final query = await db.rawQuery('''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ?
      AND date(datetime) BETWEEN date(?) AND date(?)
      ORDER BY TransLite.transactionID DESC
    ''', [id, startDate, endDate]);

    return query;
  }

  Future<List<Map<String, dynamic>>> getTransactionByStatus(
      {required String status}) async {
    final db = await database;
    final id = await localStorage.getPosLoginID();

    final query = await db.rawQuery('''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ?
      AND statusTransaction = ?
      ORDER BY TransLite.transactionID DESC
    ''', [id, status]);

    return query;
  }

  Future<List<Map<String, dynamic>>> getTransactionByDateStatus(
      {required String startDate,
      required String endDate,
      required String status}) async {
    final db = await database;
    final id = await localStorage.getPosLoginID();

    final query = await db.rawQuery('''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ?
      AND date(datetime) BETWEEN date(?) AND date(?)
      AND statusTransaction = ?
      ORDER BY TransLite.transactionID DESC
    ''', [id, startDate, endDate, status]);

    return query;
  }

  Future<List<Map<String, dynamic>>> getTransSpec({transactionNumber}) async {
    final db = await database;

    return db.rawQuery('''
      SELECT *,TransLite.TableID as tableID 
      FROM TransLite 
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID 
      WHERE transactionNumber = '$transactionNumber' 
    ''');
  }

  // :: Transaction Detail :: //
  Future<int> createTransactionDetailLite(TransDetailLiteCreate data) async {
    final db = await database;

    return db.insert('TransDetailLite', data.toMap());
  }

  Future<int> updateTransactionHold(
      String transactionNumber,
      int subTotal,
      int ppn,
      String ppnName,
      int grandTotalBeforeTax,
      int grandTotalAfterTax) async {
    final db = await database;

    return db.update(
      'TransLite',
      {
        'subTotal': subTotal,
        'discountTotal': 0,
        'grandTotalBeforeTax': grandTotalBeforeTax,
        'ppn': ppn,
        'ppnName': ppnName,
        'grandTotalAfterTax': grandTotalAfterTax
      },
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionDiscount(String transactionNumber,
      int discountTotal, String discountOnTrans) async {
    final db = await database;

    return db.update('TransLite',
        {'discountTotal': discountTotal, 'discountOnTrans': discountOnTrans},
        where: 'transactionNumber = ?', whereArgs: [transactionNumber]);
  }

  Future<int> updateTransaction(
      String transactionNumber,
      String status,
      String paymentMethod,
      int subTotal,
      int discountTotal,
      String discountOnDetail,
      int grandTotalBeforeTax,
      int ppn,
      String ppnName,
      int grandTotalAfterTax,
      int rounding,
      int grandTotalFinal,
      int transactionTypeJuncID,
      String closeDate) async {
    final db = await database;

    return db.update(
      'TransLite',
      {
        'subTotal': subTotal,
        'discountTotal': discountTotal,
        'discountOnDetail': discountOnDetail,
        'grandTotalBeforeTax': grandTotalBeforeTax,
        'ppn': ppn,
        'ppnName': ppnName,
        'grandTotalAfterTax': grandTotalAfterTax,
        'paymentMethod': paymentMethod,
        'statusTransaction': status,
        'rounding': rounding,
        'grandTotalFinal': grandTotalFinal,
        'transactionTypeJuncID': transactionTypeJuncID,
        'closeDate': closeDate,
      },
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionTable(
      {required int tableId, required String trx}) async {
    final db = await database;

    final result = db.update(
      'TransLite',
      {
        'tableID': tableId,
      },
      where: 'transactionNumber = ?',
      whereArgs: [trx],
    );

    return result;
  }

  Future<int> updateTransactionCustomer(String transactionNumber,
      String customerCode, String customerName) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'customerCode': customerCode, 'customerName': customerName},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionSync(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'statusSync': 1},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionSyncVoid(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'statusSync': 0, 'statusTransaction': 'Void'},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<List<Map<String, dynamic>>> getTransactionDetail(
      {required String transactionNumber}) async {
    final db = await database;

    return db.rawQuery('''
      SELECT TransDetailLite.*,MenuLite.stationID 
      FROM TransDetailLite 
      LEFT JOIN MenuLite ON TransDetailLite.menuID = MenuLite.menuID 
      WHERE TransDetailLite.parentID = 0 
      AND TransDetailLite.transactionNumber = ? and TransDetailLite.statusItem !=?
    ''', [transactionNumber, 'Cancelled']);
  }

  Future<List<Map<String, dynamic>>> getTransactionDetailAll(
      {required String transactionNumber}) async {
    final db = await database;

    return db.rawQuery('''
      SELECT TransDetailLite.*,MenuLite.stationID 
      FROM TransDetailLite 
      LEFT JOIN MenuLite ON TransDetailLite.menuID = MenuLite.menuID 
      WHERE TransDetailLite.parentID = 0 
      AND TransDetailLite.transactionNumber = ?
    ''', [transactionNumber]);
  }

  Future<List<Map<String, dynamic>>> getTransactionDetailClear(
      {required String transactionNumber}) async {
    final db = await database;

    return db.rawQuery('''
      SELECT TransDetailLite.*
      FROM TransDetailLite 
      where TransDetailLite.transactionNumber = ? and statusSend = 1
    ''', [transactionNumber]);
  }

  Future<List<Map<String, dynamic>>> getTransactionDetailByID(
      String transactionNumber, int transactionDetailId) async {
    final db = await database;

    return await db.query(
      'TransDetailLite',
      where: 'transactionNumber = ? AND transactionDetailID = ?',
      whereArgs: [transactionNumber, transactionDetailId],
    );
  }

  Future<List<Map<String, dynamic>>> getTransactionClose(
      {String? startDate, String? endDate, int? statusSync}) async {
    final db = await database;
    final prefs = await SharedPreferences.getInstance();

    int posLoginID = prefs.getInt("posLoginID") ?? 0;

    return db.rawQuery(
      '''
      SELECT *, TransLite.TableID as tableID
      FROM TransLite
      LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
      WHERE posLoginID = ? 
        AND statusTransaction = ? 
        AND DATE(datetime) BETWEEN DATE(?) AND DATE(?)
        AND statusSync = ?
      ''',
      [posLoginID, 'Close', startDate, endDate, statusSync],
    );
  }

  Future<List<Map<String, dynamic>>> getTransactionCloseAndVoid({
    String? startDate,
    String? endDate,
    int? statusSync,
  }) async {
    final db = await database;
    final prefs = await SharedPreferences.getInstance();

    final int posLoginID = prefs.getInt("posLoginID") ?? 0;
    // final List<String> statusList = ['Close', 'Void'];
    // final String placeholders = List.filled(statusList.length, '?').join(',');

    final String sql = '''
    SELECT *, TransLite.TableID as tableID
    FROM TransLite
    LEFT JOIN TableLite ON TransLite.TableID = TableLite.TableID
    WHERE posLoginID = ? 
      AND statusTransaction IN ('Close','Void','Cancel')
      AND DATE(datetime) BETWEEN DATE(?) AND DATE(?)
      AND statusSync = ?
  ''';

    final List<dynamic> args = [
      posLoginID,
      startDate,
      endDate,
      statusSync,
    ];

    return db.rawQuery(sql, args);
  }

  Future<List<Map<String, dynamic>>> getTransactionDetailClose(
      {String? startDate, String? endDate}) async {
    final db = await database;
    final prefs = await SharedPreferences.getInstance();

    int posLoginID = prefs.getInt("posLoginID") ?? 0;

    return db.rawQuery('''
      SELECT 
        TransLite.datetime,
        TransDetailLite.*,
        SUM(TransDetailLite.qty) as totalQty,
        SUM(TransDetailLite.menuPriceAfterDiscount * TransDetailLite.qty) as totalPriceAfterDiscount,
        SUM(TransDetailLite.menuPrice * TransDetailLite.qty) as totalPrice,
        MenuLite.stationID,
        MAX(TransLite.datetime) as latestDate
      FROM TransDetailLite 
      LEFT JOIN TransLite ON TransDetailLite.transactionNumber = TransLite.transactionNumber
      LEFT JOIN MenuLite ON TransDetailLite.menuID = MenuLite.menuID
      WHERE TransLite.posLoginID = ? 
        AND TransLite.statusTransaction = 'Close'
        AND DATE(TransLite.datetime) BETWEEN DATE(?) AND DATE(?)
      GROUP BY TransDetailLite.menuID
      ORDER BY latestDate DESC
    ''', [posLoginID, startDate, endDate]);
  }

  Future<List<Map<String, dynamic>>> getTransactionDetailAddOn(
      transactionDetailID) async {
    final db = await database;

    return db.query(
      'TransDetailLite',
      where: 'parentID = ?',
      whereArgs: [transactionDetailID],
    );
  }

  Future<int> updateTransactionDetail(
      {required int id, int? qty, String? notes}) async {
    final db = await database;

    final Map<String, dynamic> updateFields = {};

    if (qty != null) {
      updateFields['qty'] = qty;
    }
    if (notes != null) {
      updateFields['notes'] = notes;
    }

    if (updateFields.isEmpty) return 0;

    return db.update(
      'TransDetailLite',
      updateFields,
      where: 'transactionDetailID = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateTransactionDetailDiscount(int transactionDetailID,
      String discountDetail, int menuPriceAfterDiscount) async {
    final db = await database;

    return db.update(
      'TransDetailLite',
      {
        'discountDetail': discountDetail,
        'menuPriceAfterDiscount': menuPriceAfterDiscount,
      },
      where: 'transactionDetailID = ?',
      whereArgs: [transactionDetailID],
    );
  }

  Future<int> updateTransactionVoid(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'statusTransaction': 'Void', 'statusSync': 0},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionResetDiscount(String transactionNumber) async {
    final db = await database;
    // Future<int> updateTransactionResetDiscount(String transactionNumber) async {
    //   final db = await database;

    // ambil data transaksi existing
    // final trans = await db.query(
    //   'TransLite',
    //   where: 'transactionNumber = ?',
    //   whereArgs: [transactionNumber],
    //   limit: 1,
    // );

    // if (trans.isEmpty) return 0;

    // final row = trans.first;
    // final int subTotal = row['subTotal'] as int;
    // final int rounding = row['rounding'] as int;
    // final int ppn = row['ppn'] as int;
    // final int serviceCharge = row['serviceCharge'] as int;
    // final int packageNService = row['packageNService'] as int;

    // // hitung ulang total tanpa diskon
    // final int grandTotalBeforeTax = subTotal;
    // final int grandTotalAfterTax = grandTotalBeforeTax +
    //     ((grandTotalBeforeTax * ppn) ~/ 100) +
    //     serviceCharge +
    //     packageNService;
    // final int grandTotalFinal = grandTotalAfterTax + rounding;

    // // update record
    // return db.update(
    //   'TransLite',
    //   {
    //     'discountTotal': 0,
    //     'discountOnDetail': '[]',
    //     'discountOnTrans': '[]',
    //     'grandTotalBeforeTax': grandTotalBeforeTax,
    //     'grandTotalAfterTax': grandTotalAfterTax,
    //     'grandTotalFinal': grandTotalFinal,
    //   },
    //   where: 'transactionNumber = ?',
    //   whereArgs: [transactionNumber],
    // );
    return db.rawUpdate('''
      UPDATE TransLite SET discountTotal= 0,rounding=0, 
      discountOnDetail=?, discountOnTrans=?,grandTotalFinal=subTotal ,
      grandTotalBeforeTax=subTotal,grandTotalAfterTax=subTotal WHERE transactionNumber = ? 
    ''', ['[]', '[]', transactionNumber]);
    // }
    // return db.update('TransLite',
    //     {'discountTotal': 0, 'discountOnDetail': '[]', 'discountOnTrans': '[]','grandTotalFinal':grandTotalFinal},
    //     where: 'transactionNumber = ?', whereArgs: [transactionNumber]);
  }

  Future<int> updateTransactionDetailResetDiscount(
      String transactionNumber) async {
    final db = await database;

    return db.rawUpdate('''
      UPDATE TransDetailLite SET DiscountDetail = ?, 
      menuPriceAfterDiscount = menuPrice WHERE transactionNumber = ? 
    ''', ['[]', transactionNumber]);
  }

  Future<int> updateTransactionDetailSend(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransDetailLite',
      {'statusSend': 1},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionReceipt(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'statusReceipt': 1},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> deleteTransactionUnsend(String transactionNumber) async {
    final db = await database;

    return db.delete('TransLite',
        where: 'transactionNumber = ?', whereArgs: [transactionNumber]);
  }

  Future<int> deleteTransactionDetail(int transactionDetailID) async {
    final db = await database;

    return db.delete('TransDetailLite',
        where: 'transactionDetailID = ?', whereArgs: [transactionDetailID]);
  }

  Future<int> deleteTransactionDetailAddOn(int transactionDetailID) async {
    final db = await database;

    return db.delete('TransDetailLite',
        where: 'parentID = ?', whereArgs: [transactionDetailID]);
  }

  Future<int> deleteTransactionDetailUnsend(String transactionNumber) async {
    final db = await database;

    return db.delete('TransDetailLite',
        where: 'transactionNumber = ? AND statusSend = ?',
        whereArgs: [transactionNumber, 0]);
  }

  Future<int> updateTransactionDetailAddOn(int transactionDetailID) async {
    final db = await database;
    return db.update('TransDetailLite', {'statusItem': 'Cancelled'},
        where: 'transactionDetailID = ? and parentID=?',
        whereArgs: [transactionDetailID, transactionDetailID]);
  }

  Future<int> upadateTransactionDetail(int transactionDetailID) async {
    final db = await database;
    return db.update('TransDetailLite', {'statusItem': 'Cancelled'},
        where: 'transactionDetailID = ?', whereArgs: [transactionDetailID]);
  }

  Future<int> updateTransactionCancel(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransLite',
      {'statusTransaction': 'Cancel', 'transactionTypeJuncID': 0},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> updateTransactionDetailCancel(String transactionNumber) async {
    final db = await database;

    return db.update(
      'TransDetailLite',
      {'statusItem': 'Cancelled'},
      where: 'transactionNumber = ?',
      whereArgs: [transactionNumber],
    );
  }

  Future<int> deleteTransactionDetailAll(String transactionNumber) async {
    final db = await database;

    return db.delete('TransDetailLite',
        where: 'transactionNumber = ?', whereArgs: [transactionNumber]);
  }

  // :: Discount
  Future<int> insertDiscount(
      {int? masterDiscountID,
      String? masterDiscountName,
      int? discountType,
      String? valueType,
      int? discountValue,
      String? spesificMenuID,
      String? discountValidFrom,
      String? discountValidUntil,
      int? minTransDiscount,
      int? outletID,
      int? maxDiscount,
      int? qtyDiscount,
      String? availableDay}) async {
    final db = await database;

    return db.insert('DiscountLite', {
      'masterDiscountID': masterDiscountID,
      'masterDiscountName': masterDiscountName,
      'discountType': discountType,
      'valueType': valueType,
      'discountValue': discountValue,
      'spesificMenuID': spesificMenuID,
      'discountValidFrom': discountValidFrom,
      'discountValidUntil': discountValidUntil,
      'minTransDiscount': minTransDiscount,
      'outletID': outletID,
      'maxDiscount': maxDiscount,
      'qtyDiscount': qtyDiscount,
      'availableDay': availableDay,
    });
  }

  Future<int> updateDiscount(int masterDiscountID, qtyDiscount) async {
    final db = await database;

    return db.update(
        'DiscountLite',
        {
          'qtyDiscount': qtyDiscount - 1,
        },
        where: 'masterDiscountID = ?',
        whereArgs: [masterDiscountID]);
  }

  Future<List<Map<String, dynamic>>> getDiscount() async {
    final db = await database;

    return db.query('DiscountLite');
  }

  Future<List<Map<String, dynamic>>> getDiscountToday(String today) async {
    final db = await database;
    final query = await db.rawQuery('''
      SELECT * from DiscountLite
      WHERE availableDay LIKE ?
    ''', ['%"$today"%']);

    return query;
    // return db.query('DiscountLite');
  }

  Future<int> deleteDiscount() async {
    final db = await database;

    return db.delete('DiscountLite');
  }

  // :: Payment Method
  Future<int> insertPaymentMethodLite(
      {int? paymentMethodID,
      String? paymentMethodName,
      double? paymentFee}) async {
    final db = await database;

    return db.insert('PaymentMethodLite', {
      'paymentMethodID': paymentMethodID,
      'paymentMethodName': paymentMethodName,
      'paymentFee': paymentFee
    });
  }

  Future<List<Map<String, dynamic>>> getPaymentMethodLite() async {
    final db = await database;

    return db.query('PaymentMethodLite');
  }

  Future<int> deletePaymentMethodLite() async {
    final db = await database;

    return db.delete('PaymentMethodLite');
  }

  // :: Transaction Type Junc Method
  Future<int> insertTransactionTypeJuncLite(
      {int? transactionTypeJuncID,
      String? transJuncName,
      int? transTypeID,
      String? chargeType,
      int? chargeValue,
      int? outletID}) async {
    final db = await database;

    return db.insert('TransactionTypeJuncLite', {
      'transactionTypeJuncID': transactionTypeJuncID,
      'transJuncName': transJuncName,
      'transTypeID': transTypeID,
      'chargeType': chargeType,
      'chargeValue': chargeValue,
      'outletID': outletID,
    });
  }

  Future<List<Map<String, dynamic>>> getTransactionTypeJuncLite() async {
    final db = await database;

    return db.query('TransactionTypeJuncLite');
  }

  Future<int> deleteTransactionTypeJuncLite() async {
    final db = await database;

    return db.delete('TransactionTypeJuncLite');
  }

  // :: Log
  Future<int> insertLogLite(
      {String? dateTime,
      String? transactionNumber,
      String? statusReturn,
      String? statusMessage}) async {
    final db = await database;

    return db.insert('LogLite', {
      'dateTime': dateTime,
      'transactionNumber': transactionNumber,
      'statusReturn': statusReturn,
      'statusMessage': statusMessage,
    });
  }

  Future<List<Map<String, dynamic>>> getLogLite() async {
    final db = await database;

    return db.query('LogLite');
  }

  Future<int> deleteLogLite() async {
    final db = await database;

    return db.delete('LogLite');
  }

// :: Log Activity
  Future<int> insertLogActLite(
      String dateTime,
      String? transactionNumber,
      String? deviceName,
      String? activityDesc,
      String? ipAddress,
      String? activityType,
      int? userID,
      String? companyCode) async {
    final db = await database;

    return db.insert('ActPOSLite', {
      'userID': userID,
      'activityType': activityType,
      'dateTime': dateTime,
      'reffID': transactionNumber,
      'activityDesc': activityDesc,
      'ipAddress': ipAddress,
      'deviceName': deviceName,
      'companyCode': companyCode,
    });
  }

  Future<List<Map<String, dynamic>>> getLogActLite() async {
    final db = await database;

    return db.query('ActPOSLite');
  }

  Future<int> deleteLogActLite() async {
    final db = await database;

    return db.delete('ActPOSLite');
  }

  Future<int> DeleteLogActSync(int? logID) async {
    final db = await database;

    return db.delete('ActPOSLite', where: 'logID = ?', whereArgs: [logID]);
  }

  // :: Province
  Future<int> insertProvince({int? provinceID, String? provinceName}) async {
    final db = await database;

    return db.insert('ProvinceLite', {
      'provinceID': provinceID,
      'provinceName': provinceName,
    });
  }

  Future<List<ProvinceLiteModel>> getProvince() async {
    final db = await database;

    final results = await db.query('ProvinceLite');

    return results.map((json) => ProvinceLiteModel.fromJson(json)).toList();
  }

  Future<int> deleteProvince() async {
    final db = await database;

    return db.delete('ProvinceLite');
  }

  // :: City
  Future<int> insertCity(
      {int? cityID, int? provinceID, String? cityName}) async {
    final db = await database;

    return db.insert('CityLite', {
      'cityID': cityID,
      'provinceID': provinceID,
      'cityName': cityName,
    });
  }

  Future<List<CityLiteModel>> getCity() async {
    final db = await database;

    final results = await db.query('CityLite');

    return results.map((json) => CityLiteModel.fromJson(json)).toList();
  }

  Future<List<CityLiteModel>> getCityByProvinceId(
      {required int provinceId}) async {
    final db = await database;

    final results = await db.query(
      'CityLite',
      where: 'provinceID = ?',
      whereArgs: [provinceId],
    );

    return results.map((json) => CityLiteModel.fromJson(json)).toList();
  }

  Future<int> deleteCity() async {
    final db = await database;

    return db.delete('CityLite');
  }

  // :: Customer
  Future<int> insertCustomer(
      {String? customerCode,
      String? fullname,
      String? email,
      int? mobileNo,
      String? birthDate,
      int? provinceID,
      int? cityID,
      String? address,
      int? outletID}) async {
    final db = await database;

    return db.insert(
        'CustomerLite',
        {
          'customerCode': customerCode,
          'fullname': fullname,
          'email': email,
          'mobileNo': mobileNo,
          'birthDate': birthDate,
          'provinceID': provinceID,
          'cityID': cityID,
          'address': address,
          'outletID': outletID,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CustomerLiteModel>> getCustomer({String? customerCode}) async {
    final db = await database;

    // return db.query('CustomerLite');
    final results = await db.rawQuery(
      '''
      SELECT * FROM CustomerLite
      WHERE (? IS NULL OR customerCode = ?)
      ''',
      [customerCode, customerCode],
    );

    return results.map((json) => CustomerLiteModel.fromJson(json)).toList();
  }

  Future<int> deleteCustomer() async {
    final db = await database;

    return db.delete('CustomerLite');
  }

  Future<String> generateTransactionNumber() async {
    final db = await database;

    int outletId = await localStorage.getOutletID();
    final formattedOutletId = outletId.toString().padLeft(4, '0');

    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String todayLabel = DateFormat('yyMMdd').format(DateTime.now());

    List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT COUNT(*) as count FROM TransLite WHERE datetime LIKE '$today%'");

    int count = result.first['count'] + 1;
    String runningNumber = count.toString().padLeft(3, '0');

    final random = Random();
    int rng = 100 + random.nextInt(900);

    return "S$formattedOutletId-$todayLabel$rng$runningNumber";
  }

  Future<String> generateCustomerCode() async {
    final hoursLabel = DateFormat('HHmmss').format(DateTime.now());
    final random = Random();

    int rng = 100 + random.nextInt(900);

    return "C-$hoursLabel$rng";
  }

  Future<int> updateTransactionPPN(String isTransactionNumber, num tax) async {
    final db = await database;

    return db.update(
        'TransLite',
        {
          'ppn': tax,
        },
        where: 'transactionNumber = ?',
        whereArgs: [isTransactionNumber]);
  }
}
