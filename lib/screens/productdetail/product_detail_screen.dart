// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:flutter_scale/main.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/products_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {

    // รับค่าที่ส่งมาจากหน้า product_screen.dart
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['products']['product_name']),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(arguments['products']['product_image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              arguments['products']['product_name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              arguments['products']['product_detail'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/editproduct', arguments: {'products': arguments['products']});
                }, 
                icon: Icon(Icons.edit)
              ),
              IconButton(
                onPressed: () async {
                  // logger.i('Delete product id: ${arguments['products']['id']}');
                  // Confirm dialog
                  return showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text('Are you sure you want to delete this product?'),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                          ),
                          TextButton(
                            child: const Text('Delete'),
                              onPressed: () async {
                                var response = await CallAPI().deleteProduct(arguments['products']['id']);
                                if (response) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  refreshKey.currentState!.show();
                                }
                              },
                          ),
                        ],
                      );
                    }
                  );
                }, 
                icon: Icon(Icons.delete)
              ),
            ],
          )
        ],
      ),
    );
  }
}