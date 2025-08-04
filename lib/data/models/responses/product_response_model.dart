import 'dart:convert';

import 'category_response_model.dart';

class ProductModel {
  final int? id;
  final String? name;
  final int? productId;
  final int? categoryId;
  final String? description;
  final String? image;
  final String? color;
  final String? price;
  final String? cost;
  final int? stock;
  final String? barcode;
  final String? sku;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  CategoryModel? category;

  ProductModel({
    this.id,
    this.productId,
    this.name,
    this.categoryId,
    this.description,
    this.image,
    this.color,
    this.price,
    this.cost,
    this.stock,
    this.barcode,
    this.sku,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        categoryId: json["category_id"],
        description: json["description"],
        image: json["image"],
        color: json["color"],
        price: json["price"],
        cost: json["cost"],
        stock: json["stock"],
        barcode: json["barcode"],
        sku: json["sku"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : CategoryModel.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => {
    if (id != null) "id": id,
    "name": name,
    "category_id": categoryId,
    "description": description,
    "image": image,
    "color": color,
    "price": price,
    "cost": cost,
    "stock": stock,
    "barcode": barcode,
    "sku": sku,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}