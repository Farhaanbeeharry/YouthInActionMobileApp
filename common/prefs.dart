import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static SharedPreferences prefs;

  static Future<void> getInstance() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }
}
