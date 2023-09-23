

import 'package:flutter/material.dart';
import 'package:untitled32/data/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductData dataK;
  const ProductScreen({super.key, required this.dataK});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
         Image.network(
           dataK.image,
         ),
          Text(dataK.name,
            textAlign: TextAlign.center,
            style:  const TextStyle(
              fontSize: 25,
          ),
          ),
          Text(dataK.detail,
            textAlign: TextAlign.center,
            style:  const TextStyle(
              fontSize: 5,
      ),
          ),
      Text(
        'Price:${dataK.price.toString()} \$',
        textAlign: TextAlign.center,
        style:  const TextStyle(
          fontSize: 25,
      ),
      ),
    ],
    ),
    );
  }
}
