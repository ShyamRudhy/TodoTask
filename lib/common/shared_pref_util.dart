import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class SharedPrefUtil{

  static void storeIntData(String key, int data,) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key,data);
  }

  static void storeStringData(String key, String data,) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key,data);
  }

  static void storeBoolData(String key, bool data,) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key,data);
  }

  static Future<int?> getIntData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<String?> getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool?> getBoolData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static void clearSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.USER_ID_KEY);
    await prefs.remove(Constants.USER_NAME_KEY);
    await prefs.remove(Constants.USER_MAIL_ID_KEY);
    await prefs.remove(Constants.LOGIN_STATUS_KEY);
  }

  static void clearAllSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

  }

}