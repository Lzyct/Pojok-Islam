import 'package:shared_preferences/shared_preferences.dart';

///*********************************************
/// Created by ukietux on 2019-12-18 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrefManager {
  String kOnBoarding = "onboarding";
  SharedPreferences preferences;

  PrefManager(this.preferences);

  bool isFirst() => preferences.containsKey(kOnBoarding)
      ? preferences.getBool(kOnBoarding ?? false)
      : false;

  Future<bool> setIsFirst(bool _isFirst) =>
      preferences.setBool(kOnBoarding, _isFirst);

  String getString(String _key) =>
      preferences.containsKey(_key) ? preferences.getString(_key ?? "") : "";

  Future<bool> setString(String _key, String _value) =>
      preferences.setString(_key, _value);

  String getInt(String _key) =>
      preferences.containsKey(_key) ? preferences.getInt(_key ?? "") : "";

  Future<bool> setInt(String _key, int _value) =>
      preferences.setInt(_key, _value);

  Future<bool> logout() => preferences.clear();
}
