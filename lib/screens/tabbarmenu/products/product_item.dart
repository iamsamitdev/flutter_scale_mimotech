// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/image_not_found.dart';
import 'package:flutter_scale/models/product_model.dart';
import 'package:flutter_scale/utils/constants.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    required this.product,
    this.onTap,
    this.isGrid,
    Key? key,
  }): super(key: key);

  final ProductModel product;
  final VoidCallback? onTap;
  final bool? isGrid;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap, 
      child: LayoutBuilder(
        builder: (context, constraint) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              _buildImage(constraint.maxHeight),
              _buildInfo()
            ],
          ),
        ),
      )
    );
  }

  // _buildImage Widget
  Stack _buildImage(double maxHeight){
    
    // Check list or grid view
    // Case of list view
    var height = maxHeight * 0.7;

    // Case of grid view
    if(isGrid != null && isGrid == true){
      height = maxHeight * 0.5;
    }

    final image = product.productImage;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: image != null && image.isNotEmpty ? _image(image) : ImageNotFound(),
        )
      ],
    );

  }

  // _image Widget
  Image _image(String image){
    String imageUrl;
    if(image.contains('://')){
      imageUrl = image;
    }else{
      imageUrl = '${baseURLImage}stock/$image';
    }
    return Image.network(
      imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext context, Object exception,
          StackTrace? stackTrace) {
         return ImageNotFound();
       },
    );
  }

  // _buildInfo Widget
  Expanded _buildInfo() => Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.productName,
            style: (isGrid ?? false) 
            ? TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal
            ) : TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (){},
                child: Text(
                  '฿${product.productPrice}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Text(
                '${product.productQty} ชิ้น',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                ),
              )
            ],
          )
        ],
      ),
    )
  );


}