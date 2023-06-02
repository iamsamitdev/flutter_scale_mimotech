// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottomnavmenu/home/home_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/notification/notification_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/profile/profile_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/report/report_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/setting/setting_screen.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_scale/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // -------- ส่วนของการอ่านข้อมูล user profile ------------------
  // สร้างตัวแปรสำหรับเก็บโปรไฟล์
  String? _username, _fullname, _imgProfile;

  // สร้างฟังก์ชันอ่านข้อมูลจาก shared preferences
  readUserProfile() async {
      // Create shared preferences instance
      SharedPreferences prefs = await SharedPreferences.getInstance();
  
      // อ่านข้อมูลจาก shared preferences
      setState(() {
        _username = prefs.getString('userName');
        _fullname = prefs.getString('fullName');
        _imgProfile = prefs.getString('imgProfile');
      });
  }

  // ฟังก์ชันที่จะถูกเรียกใช้งานก่อน build
  @override
  void initState() {
    super.initState();
    readUserProfile();
  }
  
  // ------- ส่วนของการโหลดสลับข้อมูล Bottom Navigation --------
  // สร้างตัวแปรเก็บ title ของ bottom navigation
  String _title = 'Dashboard';

  // สร้างตัวแปรสำหรับเก็บ index ของ bottom navigation
  int _currentIndex = 0;

  // สร้าง List ของ bottom navigation
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    ProfileScreen()
  ];

  // สร้างฟังก์ชันสำหรับเปลี่ยนหน้าของ bottom navigation
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: _title = 'Dashboard'; break;
        case 1: _title = 'Report'; break;
        case 2: _title = 'Notification'; break;
        case 3: _title = 'Setting'; break;
        case 4: _title = 'Profile'; break;
        default: _title = 'Dashboard'; break;
      }
    });
  }


  // -------- ส่วนของการออกจากระบบ --------------------------
  // Logout Method
  logout() async {

    // Create shared preferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear shared preferences
    prefs.clear();

    // Set step to 1
    prefs.setInt('step', 1);

    // Navigate to welcome screen
    Navigator.pushReplacementNamed(context, '/login');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
          // backgroundColor: primaryLight,
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(_fullname ?? '...'),
                    accountEmail: Text(_username ?? '...'),
                    currentAccountPicture: _imgProfile != null ?  
                    CircleAvatar(
                      backgroundImage: NetworkImage(baseURLImage + 'profile/' + _imgProfile!),
                    ) : CircularProgressIndicator(),
                    decoration: BoxDecoration(
                      color: primaryDark,
                    ),
                    otherAccountsPictures: [
                      CircleAvatar(
                      backgroundImage: NetworkImage('https://www.itgenius.co.th/backend/assets/images/user_avatar/2qxyqud0ha7wj4nf6p26xxy0heoyyxkz.jpg'),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://www.itgenius.co.th/backend/assets/images/user_avatar/2qxyqud0ha7wj4nf6p26xxy0heoyyxkz.jpg'),
                    )
                    ],
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Info',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to info screen
                      Navigator.pushNamed(context, '/info');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'About',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to about screen
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Contact',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to contact screen
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                ],
              ),
              Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: logout,
                  ),
                ],
              ))
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDark,
        unselectedItemColor: secondaryText,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ]
      ),
    );
  }
}