// lib/utils/app_preferences.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String _firstLaunchKey = 'first_launch';

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool(_firstLaunchKey) ?? true;
    
    if (isFirstLaunch) {
      await prefs.setBool(_firstLaunchKey, false);
    }
    
    return isFirstLaunch;
  }

  static Future<bool> isLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }
}