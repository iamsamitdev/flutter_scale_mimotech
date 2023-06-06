// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      decoration: BoxDecoration(
        color: primaryDark
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.hello,
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          Text(
            'Administrator',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
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
          title: Text('Account'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.password),
          title: Text('Change Password'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Change Language'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          onTap: (){
            // Create alert dialog select language
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Select Language'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        InkWell(
                          child: Text('English'),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          child: Text('Thai'),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          child: Text('Chinese'),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          onTap: (){},
        ),
      ],
    );
  }
}