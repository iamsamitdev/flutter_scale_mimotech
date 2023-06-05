// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/main.dart';
import 'package:flutter_scale/models/product_model.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/product_item.dart';
import 'package:flutter_scale/services/rest_api.dart';

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
              icon: Icon(_isGridView ? Icons.list : Icons.grid_view))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: CallAPI().getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('มีข้อผิดพลาด โปรดลองใหม่อีกครั้ง'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<ProductModel> products = snapshot.data;
              return _isGridView 
                ? _gridView(products) 
                : _listView(products);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // _listView Widget
  Widget _listView(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: SizedBox(
            height: 350,
            child: ProductItem(
              product: products[index],
              onTap: () {
                logger.d('Item $index clicked');
              },
            ),
          ),
        );
      },
    );
  }

  // _gridView Widget
  Widget _gridView(List<ProductModel> products) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 // จำนวนคอลัมน์
            ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            isGrid: true,
            onTap: () {
              logger.d('Item $index clicked');
            },
          );
        });
  }
}
