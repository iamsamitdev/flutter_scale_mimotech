import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {

  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  // Shared preferences for save locale
  SharedPreferences? _sharedPreferences;

  // Constructor
  LocaleProvider(Locale locale) {
    _locale = locale;
  }

  // Change locale
  void changeLocale(Locale newLocale) async {

    // Save locale to shared preferences
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences!.setString('languageCode', newLocale.languageCode);

    _locale = newLocale;
    notifyListeners();
  }

}