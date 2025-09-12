import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _OutletKeys {
  static const imageUrl = "outletImageUrl";
  static const posLoginID = "posLoginID";
  static const outletID = "outletID";
  // static const outletType = "outletType";
  static const companyCode = "companyCode";
  static const outletName = "outletName";
  static const outletCode = "outletCode";
  static const outletImage = "outletImage";
  static const outletFB = "outletFB";
  static const outletIG = "outletIG";
  static const outletTIKTOK = "outletTIKTOK";
  static const outletWeb = "outletWeb";
  static const dataStaff = "dataStaff";
  static const token = "token";
  static const selectedTrans = "selectedTrans";
  static const screenLocked = "screenLocked";
  static const tableMap = "tableMap";
  static const firstSync = "firstSync";
  static const staffPinId = "staffPINID";
  static const staffName = "staffName";
  static const actionName = "actionName";
  static const outletType = "outletType";
  static const primaryPrinter = "primaryPrinter";
  static const bluetoothPrinter = "bluetoothPrinter";
}

class LocalStorage extends GetxService {
  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  Future<void> _setString(String key, String value) async =>
      (await _prefs).setString(key, value);
  Future<String> _getString(String key) async =>
      (await _prefs).getString(key) ?? "";

  Future<void> _setInt(String key, int value) async =>
      (await _prefs).setInt(key, value);
  Future<int> _getInt(String key) async => (await _prefs).getInt(key) ?? 0;

  Future<void> _setBool(String key, bool value) async =>
      (await _prefs).setBool(key, value);
  Future<bool> _getBool(String key) async =>
      (await _prefs).getBool(key) ?? false;

  Future<void> _setStringList(String key, List<String> value) async =>
      (await _prefs).setStringList(key, value);
  Future<List<String>> _getStringList(String key) async =>
      (await _prefs).getStringList(key) ?? ["", ""];

  Future<void> _remove(String key) async => (await _prefs).remove(key);

  // :: image url
  Future<void> saveImageUrl(String value) =>
      _setString(_OutletKeys.imageUrl, value);
  Future<String> getImageUrl() => _getString(_OutletKeys.imageUrl);
  Future<void> removeImageUrl() => _remove(_OutletKeys.imageUrl);

  // :: posLoginID
  Future<void> savePosLoginID(int value) =>
      _setInt(_OutletKeys.posLoginID, value);
  Future<int> getPosLoginID() => _getInt(_OutletKeys.posLoginID);
  Future<void> removePosLoginID() => _remove(_OutletKeys.posLoginID);

  // :: outletID
  Future<void> saveOutletID(int value) => _setInt(_OutletKeys.outletID, value);
  Future<int> getOutletID() => _getInt(_OutletKeys.outletID);
  Future<void> removeOutletID() => _remove(_OutletKeys.outletID);

  Future<void> saveOutletType(String value) =>
      _setString(_OutletKeys.outletType, value);

  Future<String> getOutletType() => _getString(_OutletKeys.outletType);
  Future<void> removeOutletType() => _remove(_OutletKeys.outletType);

  // :: Company Code
  Future<void> saveCompanyCode(String value) =>
      _setString(_OutletKeys.companyCode, value);
  Future<String> getCompanyCode() => _getString(_OutletKeys.companyCode);
  Future<void> removeCompanyCode() => _remove(_OutletKeys.companyCode);

  // :: outletName
  Future<void> saveOutletName(String value) =>
      _setString(_OutletKeys.outletName, value);
  Future<String> getOutletName() => _getString(_OutletKeys.outletName);
  Future<void> removeOutletName() => _remove(_OutletKeys.outletName);

  // :: outletCode
  Future<void> saveOutletCode(String value) =>
      _setString(_OutletKeys.outletCode, value);
  Future<String> getOutletCode() => _getString(_OutletKeys.outletCode);
  Future<void> removeOutletCode() => _remove(_OutletKeys.outletCode);

  // :: outletImage
  Future<void> saveOutletImage(String value) =>
      _setString(_OutletKeys.outletImage, value);
  Future<String> getOutletImage() => _getString(_OutletKeys.outletImage);
  Future<void> removeOutletImage() => _remove(_OutletKeys.outletImage);

  // :: FB
  Future<void> saveOutletFB(String value) =>
      _setString(_OutletKeys.outletFB, value);
  Future<String> getOutletFB() => _getString(_OutletKeys.outletFB);
  Future<void> removeOutletFB() => _remove(_OutletKeys.outletFB);

  // :: IG
  Future<void> saveOutletIG(String value) =>
      _setString(_OutletKeys.outletIG, value);
  Future<String> getOutletIG() => _getString(_OutletKeys.outletIG);
  Future<void> removeOutletIG() => _remove(_OutletKeys.outletIG);

  // :: TIKTOK
  Future<void> saveOutletTiktok(String value) =>
      _setString(_OutletKeys.outletTIKTOK, value);
  Future<String> getOutletTiktok() => _getString(_OutletKeys.outletTIKTOK);
  Future<void> removeOutletTiktok() => _remove(_OutletKeys.outletTIKTOK);

  // :: Web
  Future<void> saveOutletWeb(String value) =>
      _setString(_OutletKeys.outletWeb, value);
  Future<String> getOutletWeb() => _getString(_OutletKeys.outletWeb);
  Future<void> removeOutletWeb() => _remove(_OutletKeys.outletWeb);

  // :: dataStaff
  Future<void> saveDataStaff(String value) =>
      _setString(_OutletKeys.dataStaff, value);
  Future<String> getDataStaff() => _getString(_OutletKeys.dataStaff);
  Future<void> removeDataStaff() => _remove(_OutletKeys.dataStaff);

  // :: token
  Future<void> saveToken(String value) => _setString(_OutletKeys.token, value);
  Future<String> getToken() => _getString(_OutletKeys.token);
  Future<void> removeToken() => _remove(_OutletKeys.token);

  // :: selectedTrans
  Future<void> saveSelectedTrans(int value) =>
      _setInt(_OutletKeys.selectedTrans, value);
  Future<int> getSelectedTrans() => _getInt(_OutletKeys.selectedTrans);
  Future<void> removeSelectedTrans() => _remove(_OutletKeys.selectedTrans);

  // :: screenLocked
  Future<void> saveScreenLocked(bool value) =>
      _setBool(_OutletKeys.screenLocked, value);
  Future<bool> getScreenLocked() => _getBool(_OutletKeys.screenLocked);
  Future<void> removeScreenLocked() => _remove(_OutletKeys.screenLocked);

  // :: tableMap
  Future<void> saveTableMap(bool value) =>
      _setBool(_OutletKeys.tableMap, value);
  Future<bool> getTableMap() => _getBool(_OutletKeys.tableMap);
  Future<void> removeTableMap() => _remove(_OutletKeys.tableMap);

  // :: first sync
  Future<void> saveFirstSync(bool value) =>
      _setBool(_OutletKeys.firstSync, value);
  Future<bool> getFirstSync() => _getBool(_OutletKeys.firstSync);
  Future<void> removeFirstSync() => _remove(_OutletKeys.firstSync);

  // :: Staff Pin Id
  Future<void> saveStaffPinId(String value) =>
      _setString(_OutletKeys.staffPinId, value);
  Future<String> getStaffPinId() => _getString(_OutletKeys.staffPinId);
  Future<void> removeStaffPinId() => _remove(_OutletKeys.staffPinId);

  // :: Staff Name
  Future<void> saveStaffName(String value) =>
      _setString(_OutletKeys.staffName, value);
  Future<String> getStaffName() => _getString(_OutletKeys.staffName);
  Future<void> removeStaffName() => _remove(_OutletKeys.staffName);

  // :: Action Name
  Future<void> saveActionName(String value) =>
      _setString(_OutletKeys.actionName, value);
  Future<String> getActionName() => _getString(_OutletKeys.actionName);
  Future<void> removeActionName() => _remove(_OutletKeys.actionName);

  // :: Station Name
  Future<void> saveStationName(String key, String value) =>
      _setString(key, value);
  Future<String> getStationName(String key) => _getString(key);
  Future<void> removeStationName(String key) => _remove(key);

  // :: primaryPrinter
  Future<void> savePrimaryPrinter(List<String> value) =>
      _setStringList(_OutletKeys.primaryPrinter, value);
  Future<List<String>> getPrimaryPrinter() =>
      _getStringList(_OutletKeys.primaryPrinter);
  Future<void> removePrimaryPrinter() => _remove(_OutletKeys.primaryPrinter);

  // :: Bluetooth Printer
  Future<void> saveBluetoothPrinter(String value) =>
      _setString(_OutletKeys.bluetoothPrinter, value);
  Future<String> getBluetoothPrinter() =>
      _getString(_OutletKeys.bluetoothPrinter);
  Future<void> removeBluetoothPrinter() =>
      _remove(_OutletKeys.bluetoothPrinter);

  // :: Remove all
  Future<void> clearAllOutletData() async => (await _prefs).clear();
}
