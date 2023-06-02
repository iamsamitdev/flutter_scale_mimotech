// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

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
                      onPressed: (){
                        // ตรวจสอบค่าจาก form
                        if(formKey.currentState!.validate()){
                          // ถ้าผ่าน ให้ทำการบันทึกค่า
                          formKey.currentState!.save();
                          // แสดงค่าที่บันทึก
                          print('Username: $_username');
                          print('Password: $_password');
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