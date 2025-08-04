import 'dart:convert';

import 'package:eky_pos/data/models/responses/product_response_model.dart';

class ProductQuantity {
  final ProductModel product;
  int quantity;
  ProductQuantity({
    required this.product,
    required this.quantity,
  });

  // Map<String, dynamic> toMap() {
  //   final priceNum = double.tryParse(product.price ?? '') ?? 0;
  //   return {
  //     'product_id': product.id,
  //     'quantity': quantity,
  //     'price': priceNum,
  //     'total': priceNum * quantity,
  //   };
  // }

  // String toJson() => json.encode(toMap());
}
