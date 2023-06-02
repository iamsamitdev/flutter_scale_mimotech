// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // สร้าง key สำหรับ form
  final formKey = GlobalKey<FormState>();

  // สร้างตัวแปรไว้เก็บค่า username และ password
  late String _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Image.asset('assets/images/logo.png', height: 100,),
                  SizedBox(height: 40,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'กรุณากรอกชื่อผู้ใช้งาน';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _username = value!.toString().trim();
                      }
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'กรุณากรอกรหัสผ่าน';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _password = value!.toString().trim();
                      }
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        // ตรวจสอบค่าจาก form
                        if(formKey.currentState!.validate()){
                          // ถ้าผ่าน ให้ทำการบันทึกค่า
                          formKey.currentState!.save();

                          // เรียกใช้งาน API Login
                          var response = await CallAPI().loginAPI(
                            {
                              'username': _username,
                              'password': _password
                            }
                          );

                          var body = jsonDecode(response.body);
                          // print(body);

                          if(body['status'] == 'success'){

                            // Create shared preference object
                            SharedPreferences prefs = await SharedPreferences.getInstance();

                            // Save user data to shared preference
                            prefs.setString('userID', body['data']['id']);
                            prefs.setString('userName', body['data']['username']);
                            prefs.setString('fullName', body['data']['fullname']);
                            prefs.setString('imgProfile', body['data']['img_profile']);
                            prefs.setInt('step', 2);

                            // ถ้า login สำเร็จ ให้เปิดหน้า Dashboard
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          }else{
                            // ถ้า login ไม่สำเร็จ ให้แสดงข้อความ
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(child: Text(body['message'])),
                                backgroundColor: Colors.red,
                              )
                            );
                          }

                        }
                      },
                      child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}