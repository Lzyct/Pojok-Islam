import 'package:shared_preferences/shared_preferences.dart';

///*********************************************
/// Created by ukietux on 2019-12-18 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrefManager {
  String kOnBoarding = "onboarding";
  String kLastLocation = "currentLocation";
  String kCurrentMethod = "currentMethod";

  SharedPreferences preferences;

  PrefManager(this.preferences);

  bool isNotFirst() => preferences.containsKey(kOnBoarding)
      ? preferences.getBool(kOnBoarding ?? false)
      : false;

  Future<bool> setIsNotFirst(bool _isFirst) =>
      preferences.setBool(kOnBoarding, _isFirst);

  String getString(String _key) =>
      preferences.containsKey(_key) ? preferences.getString(_key ?? "") : "";

  Future<bool> setString(String _key, String _value) =>
      preferences.setString(_key, _value);

  String getInt(String _key) =>
      preferences.containsKey(_key) ? preferences.getInt(_key ?? "") : "";

  Future<bool> setInt(String _key, int _value) =>
      preferences.setInt(_key, _value);

  String getLastLocation() => preferences.containsKey(kLastLocation)
      ? preferences.getString(kLastLocation ?? "")
      : "";

  Future<bool> setLastLocation(String _value) =>
      preferences.setString(kLastLocation, _value);

  String getCurrentMethod() => preferences.containsKey(kCurrentMethod)
      ? preferences.getString(kCurrentMethod ?? "")
      : "";

  Future<bool> setCurrentMethod(String _value) =>
      preferences.setString(kCurrentMethod, _value);

  Future<bool> logout() => preferences.clear();
}
