import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  
  ThemeData _themeData;
  
  // status
  bool _isDark = false;

  // getter
  bool get isDark => _isDark;
  
  // Constructor
  ThemeProvider(this._themeData);

  // Getter
  getTheme() => _themeData;

  // Shared preferences instance
  SharedPreferences? _sharedPreferences;

  // Set Theme
  setTheme(ThemeData themeData) async {
    _isDark = !_isDark;
    _themeData = themeData;

    // Save theme in shared preferences
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences?.setBool('isDark', _isDark);

    notifyListeners();
  }

}
