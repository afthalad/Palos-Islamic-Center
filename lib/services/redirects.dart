import 'package:shared_preferences/shared_preferences.dart';

class Redirects {
  static Future<bool> drawerList() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("loggedin") ?? false;

    return isLoggedIn;
  }
}
