// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_scale/provider/locale_provider.dart';
import 'package:flutter_scale/provider/theme_provider.dart';
import 'package:flutter_scale/routers/app_router.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var initURL;
var locale;
ThemeData? themeData;

// Logger
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);

// Print logger
void _printLogger() {
  logger.d('Debug');
  logger.e('Error');
  logger.w('Warning');
  logger.i('Info');
  logger.v('Verbose');
  logger.wtf('What a terrible failure');
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // ต้องเรียกใช้เพื่อให้ทำงานก่อน runApp

  // Create shared preferences instance
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getInt('step') == null){
    initURL = '/';
  } else if(prefs.getInt('step') == 1){
    initURL = '/login';
  } else if(prefs.getInt('step') == 2){
    initURL = '/dashboard';
  }

  // Set default locale
  String? languageCode = prefs.getString('languageCode');
  locale = Locale(languageCode ?? 'en');

  // Set default theme
  bool? isDark = prefs.getBool('isDark');
  themeData = isDark == true && isDark != null ? AppTheme.darkTheme : AppTheme.lightTheme;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(locale),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(themeData!),
        ),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, locale, theme, child) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale.locale,
            debugShowCheckedModeBanner: false,
            theme: theme.getTheme(),
            initialRoute: initURL,
            routes: AppRouter.routes,
          );
        },
      ),
    );
  }
}

