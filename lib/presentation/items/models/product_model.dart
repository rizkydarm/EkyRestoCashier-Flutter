import 'dart:convert';

// class ProductModel {
//   int? id;
//   final String name;
//   final int categoryId;
//   final double price;
//   final double cost;
//   final int stock;
//   final String color;
//   final String barcode;
//   final String description;
//   int? businessId;
//   int? outletId;

//   ProductModel({
//     this.id,
//     required this.name,
//     required this.categoryId,
//     required this.price,
//     required this.cost,
//     required this.stock,
//     required this.color,
//     required this.barcode,
//     required this.description,
//     this.businessId,
//     this.outletId,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'category_id': categoryId,
//       'price': price,
//       'cost': cost,
//       'stock': stock,
//       'color': color,
//       'barcode': barcode,
//       'description': description,
//       'business_id': businessId,
//       'outlet_id': outletId,
//     };
//   }

//   Map<String, dynamic> toMapString() {
//     return {
//       'id': id.toString(),
//       'name': name,
//       'category_id': categoryId.toString(),
//       'price': price.toString(),
//       'cost': cost.toString(),
//       'stock': stock.toString(),
//       'color': color,
//       'barcode': barcode,
//       'description': description,
//       'business_id': businessId?.toString(),
//       'outlet_id': outletId?.toString(),
//     };
//   }

//   String toJson() => json.encode(toMap());
// }

//convertion color to string
String colorToString(int color) {
  return color.toRadixString(16).padLeft(6, '0');
}
