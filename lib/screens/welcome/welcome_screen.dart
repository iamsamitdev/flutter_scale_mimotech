// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  // Toggle between _gridView and _listView
  bool _isGridView = false;

  // Method to toggle between _gridView and _listView
  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยินดีต้อนรับ'),
        actions: [
          IconButton(
            onPressed: () {
              _toggleView();
            },
            icon: Icon(
              _isGridView ? Icons.list : Icons.grid_view,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('ยินดีต้อนรับ'),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/login');
      //         },
      //         child: const Text('เข้าสู่ระบบ'),
      //       ),
      //     ],
      //   ),
      // ),
      body: _isGridView ? _gridView() : _listView(),
    );
  }

  // _gridView widget

  Widget _gridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
      ),
      itemCount: 12, // Replace with your item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Handle the item click event
            print('Item $index clicked');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }

  // _listView widget
  Widget _listView() {
    return ListView.builder(
      itemCount: 12, // Replace with your item count
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            print('Item $index clicked');
          },
          title: Text('Item $index'),
        );
      },
    );
  }


}
