// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/main.dart';
import 'package:flutter_scale/models/product_model.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/product_item.dart';
import 'package:flutter_scale/services/rest_api.dart';

var refreshKey = GlobalKey<RefreshIndicatorState>();

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
        leading: IconButton(
          onPressed: _toggleView,
          icon: Icon(_isGridView ? Icons.list_outlined : Icons.grid_view),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addproduct');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: RefreshIndicator(
          key: refreshKey,
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
                return _isGridView ? _gridView(products) : _listView(products);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
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
                // logger.d('Item $index clicked');
                Navigator.pushNamed(
                  context,
                  '/productdetail',
                  arguments: {
                    'products': products[index].toJson(),
                  },
                );
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
              // logger.d('Item $index clicked');
              Navigator.pushNamed(
                context,
                '/productdetail',
                arguments: {
                  'products': products[index].toJson(),
                },
              );
            },
          );
        });
  }
}
