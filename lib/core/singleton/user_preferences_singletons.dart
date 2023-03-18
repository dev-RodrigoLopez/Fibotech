import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  factory UserPreferences() {
    _instance ??= UserPreferences._();
    return _instance!;
  }
  UserPreferences._();

  static UserPreferences? _instance;

  static late SharedPreferences prefs;

  static Future<void> initPrefts() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> cleanPrefts() async {
    await prefs.clear();
  }

  static Future<void> reload() async{
    await prefs.reload();
  }

  static bool get getAlert {
    final gpsAlert = prefs.getBool('alertgps');
    if (gpsAlert == null) return false;
    return gpsAlert;
  }

  static set getAlert(bool value) {
    prefs.setBool('alertgps', value);
  }

  static bool get checkAppApptransparency {
    final checkAppApptransparency =
        prefs.getBool('checkAppApptransparency');
    if (checkAppApptransparency == null) return false;
    return checkAppApptransparency;
  }

  static set checkAppApptransparency(bool value) {
    prefs.setBool('checkAppApptransparency', value);
  }

  static String get idiom {
    final idiom = prefs.getString('idiom');
    if (idiom == null) return 'ES';
    return idiom;
  }

  static set idiom(String value) {
    prefs.setString('idiom', value);
  }

}
