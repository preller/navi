import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
  // final List<Map<String, String>> products;
  // final Function addProduct;
  // final Function deleteProduct;

  // ProductManager(this.products, this.addProduct, this.deleteProduct);
  ProductManager();
  
  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          // child: ProductControl(addProduct),
          child: Text('1'),
        )
        // Expanded(child: Products(products, deleteProduct: deleteProduct))
      ],
    );
  }
}
