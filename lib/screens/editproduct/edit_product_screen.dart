// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/models/product_model.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/products_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _formKey = GlobalKey<FormState>();

  // ตัวแปรสำหรับเก็บค่าจากฟอร์ม
  String? _productName, _productDetail, _productBarcode, _productPrice, _productQty, _productImage;

  @override
  Widget build(BuildContext context) {

     // รับค่าจาก arguments
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขรายการสินค้า'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: ListView(
            children: [
              CustomTextField(
                context, 
                'Product name', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product name';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productName = onSaveVal;
                },
                initialValue: arguments['products']['product_name'].toString(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Detail', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product detail';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productDetail = onSaveVal;
                },
                initialValue: arguments['products']['product_detail'].toString(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Barcode', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product barcode';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productBarcode = onSaveVal;
                },
                initialValue: arguments['products']['product_barcode'].toString(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Price', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product price';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productPrice = onSaveVal;
                },
                initialValue: arguments['products']['product_price'].toString(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Qty', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product qty';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productQty = onSaveVal;
                },
                initialValue: arguments['products']['product_qty'].toString(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Image', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'Please enter product image';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productImage = onSaveVal;
                },
                initialValue: arguments['products']['product_image'].toString(),
              ),
              SizedBox(height: 10),
              CustomButton(
                'Update Product',
                () async {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();

                    // Call API
                    ProductModel productModel = ProductModel(
                      id: arguments['products']['id'].toString(),
                      productName: _productName.toString(),
                      productDetail: _productDetail.toString(),
                      productBarcode: _productBarcode.toString(),
                      productPrice: _productPrice.toString(),
                      productQty: _productQty.toString(),
                      productImage: _productImage.toString(),
                    );

                    var response = await CallAPI().updateProduct(productModel);

                    // print(response);

                    if(response){
                      // ส่งค่ากลับไปหน้า product
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                      // refresh หน้า product
                      refreshKey.currentState!.show();
                    }else{
                      // แจ้งเตือน
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('เกิดข้อผิดพลาดในการแก้ไขรายการสินค้า'),
                        )
                      );
                    }
                  }
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}