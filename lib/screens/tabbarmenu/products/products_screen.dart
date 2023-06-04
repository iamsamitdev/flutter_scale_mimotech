// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  // Toggle between ListView and GridView
  bool _isGridView = true;

  // สร้างฟังก์ชันสลับระหว่าง ListView และ GridView
  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _toggleView, 
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view)
          )
        ],
      ),
      body: _isGridView ? _gridView() : _listView(),
    );
  }

  // _listView Widget
  Widget _listView() {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              print('Item $index clicked');
            },
            title: Text('Item $index')
          );
        }
    );
  }

  // _gridView Widget
  Widget _gridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2 // จำนวนคอลัมน์
      ),
      itemCount: 12, 
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            print('Item $index clicked');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Center(
              child: Text('Item $index')
            ),
          ),
        );
      }
    );
  }

}