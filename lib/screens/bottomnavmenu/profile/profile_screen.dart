// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:flutter_scale/main.dart';
import 'package:flutter_scale/provider/locale_provider.dart';
import 'package:flutter_scale/provider/theme_provider.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              _buildHeader(),
              _buildListMenu(),
              Consumer<ThemeProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: provider.isDark,
                        onChanged: (value) {
                          // Toggle
                          provider.setTheme(provider.isDark
                              ? AppTheme.lightTheme
                              : AppTheme.darkTheme);
                        },
                      ),
                      Text(provider.isDark ? 'Light Mode': 'Dark Mode'),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  // _buildHeader widget
  Widget _buildHeader() {
    return Container(
      height: 230,
      decoration: BoxDecoration(color: primaryDark),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.hello,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/samitkk.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            'Samit Koyom',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Administrator',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // _buildListMenu widget
  Widget _buildListMenu() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            AppLocalizations.of(context)!.menu_account,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.password),
          title: Text(AppLocalizations.of(context)!.menu_changepass),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text(AppLocalizations.of(context)!.menu_changelang),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {
            // Create alert dialog select language
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      AppLocalizations.of(context)!.label_chooselang,
                    ),
                    content: SingleChildScrollView(
                      child: Consumer<LocaleProvider>(
                        builder: (context, provider, child) {
                          return ListBody(
                            children: [
                              InkWell(
                                child: Text('English'),
                                onTap: () {
                                  Navigator.pop(context);
                                  provider.changeLocale(const Locale('en'));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Text('Thai'),
                                onTap: () {
                                  Navigator.pop(context);
                                  provider.changeLocale(const Locale('th'));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Text('Chinese'),
                                onTap: () {
                                  Navigator.pop(context);
                                  provider.changeLocale(const Locale('zh'));
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                });
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            AppLocalizations.of(context)!.menu_setting,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(AppLocalizations.of(context)!.menu_logout),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
