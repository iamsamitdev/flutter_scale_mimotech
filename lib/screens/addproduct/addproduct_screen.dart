// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/models/product_model.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/products_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  // Form key
  final _formKey = GlobalKey<FormState>();

  // สร้างตัวแปรไว้เก็บค่าจากฟอร์ม
  String? _productName, _productDetail, _productBarcode, _productPrice, _productQty, _productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          refreshKey.currentState?.show();
          return true;
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ListView(
              children: [
                CustomTextField(
                  context, 
                  'Product name', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product name';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productName = onSavedVal;
                  }
                ),
                SizedBox(height: 10),
                CustomTextField(
                  context, 
                  'Product detail', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product detail';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productDetail = onSavedVal;
                  },
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  context, 
                  'Product barcode', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product barcode';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productBarcode = onSavedVal;
                  }
                ),
                SizedBox(height: 10),
                CustomTextField(
                  context, 
                  'Product price', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product price';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productPrice = onSavedVal;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  context, 
                  'Product qty', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product qty';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productQty = onSavedVal;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  context, 
                  'Product image', 
                  (onValidateVal){
                    if(onValidateVal.isEmpty){
                      return 'Please enter product image';
                    } else {
                      return null;
                    }
                  }, 
                  (onSavedVal){
                    _productImage = onSavedVal;
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  'Submit', 
                  () async {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
      
                      // ส่งค่าไปยัง API
                      ProductModel productModel = ProductModel(
                        productName: _productName.toString(), 
                        productDetail: _productDetail.toString(), 
                        productBarcode: _productBarcode.toString(), 
                        productPrice: _productPrice.toString(), 
                        productQty: _productQty.toString(), 
                        productImage: _productImage.toString()
                      );
      
                      var response = await CallAPI().addProduct(productModel);
      
                      if(response){
                        Navigator.pop(context, true);
                        // refresh หน้า product screen
                        refreshKey.currentState!.show();
                      } else {
                        // Message error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('เกิดข้อผิดพลาดในการบันทึกรายการสินค้า'),
                          )
                        );
                      }
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}