// ignore_for_file: file_names

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String? id;
    String productDetail;
    String productName;
    String productBarcode;
    String productQty;
    String productPrice;
    DateTime? productDate;
    String productImage;
    String? productCategory;
    String? productStatus;

    ProductModel({
        this.id,
        required this.productDetail,
        required this.productName,
        required this.productBarcode,
        required this.productQty,
        required this.productPrice,
        this.productDate,
        required this.productImage,
        this.productCategory,
        this.productStatus,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productDetail: json["product_detail"],
        productName: json["product_name"],
        productBarcode: json["product_barcode"],
        productQty: json["product_qty"],
        productPrice: json["product_price"],
        productDate: DateTime.parse(json["product_date"]),
        productImage: json["product_image"],
        productCategory: json["product_category"],
        productStatus: json["product_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_detail": productDetail,
        "product_name": productName,
        "product_barcode": productBarcode,
        "product_qty": productQty,
        "product_price": productPrice,
        "product_date": "${productDate?.year.toString().padLeft(4, '0')}-${productDate?.month.toString().padLeft(2, '0')}-${productDate?.day.toString().padLeft(2, '0')}",
        "product_image": productImage,
        "product_category": productCategory,
        "product_status": productStatus,
    };
}
