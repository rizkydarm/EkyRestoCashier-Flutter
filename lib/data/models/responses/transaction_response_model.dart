import 'dart:convert';

import 'package:eky_pos/data/models/responses/product_response_model.dart';

double? _toDouble(dynamic v) => v == null ? null : (v is double ? v : double.tryParse(v.toString()));

class TransactionItemModel {
  final int? id;
  final String? transactionId;
  final int? productId;
  final int? quantity;
  final double? totalPrice;
  final DateTime? createdAt;
  ProductModel? product;

  TransactionItemModel({
    this.id,
    this.transactionId,
    this.productId,
    this.quantity,
    this.totalPrice,
    this.createdAt,
    this.product,
  });

  factory TransactionItemModel.fromJson(String str) => TransactionItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionItemModel.fromMap(Map<String, dynamic> json) => TransactionItemModel(
    id: json['id'],
    transactionId: json['transaction_id'],
    productId: json['product_id'],
    quantity: json['quantity'],
    totalPrice: _toDouble(json['total_price']),
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    product: json['product'] == null ? null : ProductModel.fromMap(json['product']),
  );

  Map<String, dynamic> toMap() => {
    if (id != null) "id": id,
    'transaction_id': transactionId,
    'product_id': productId,
    'quantity': quantity,
    'total_price': totalPrice,
    'created_at': createdAt?.toIso8601String(),
  };
}

class TransactionModel {
  final int? id;
  final String? transactionId;
  final double? totalPrice;
  final int? totalItems;
  final String? paymentMethod;
  final String? status;
  final DateTime? createdAt;
  List<TransactionItemModel>? items;

  TransactionModel({
    this.id,
    this.transactionId,
    this.totalPrice,
    this.totalItems,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.items,
  });

  Map<String, dynamic> toMap() => {
    if (id != null) "id": id,
    'transaction_id': transactionId,
    'total_price': totalPrice,
    'total_items': totalItems,
    'payment_method': paymentMethod,
    'status': status,
    'created_at': createdAt?.toIso8601String(),
  };

  factory TransactionModel.fromMap(Map<String, dynamic> map) => TransactionModel(
    id: map['id'],
    transactionId: map['transaction_id'],
    totalPrice: _toDouble(map['total_price']),
    totalItems: map['total_items'],
    paymentMethod: map['payment_method'],
    status: map['status'],
    createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    items: map['items'] != null ? List<TransactionItemModel>.from(map['items'].map((x) => TransactionItemModel.fromMap(x))) : null,
  );

  factory TransactionModel.fromJson(String str) => TransactionModel.fromMap(json.decode(str));

  TransactionModel copyWith({
    int? id,
    String? transactionId,
    double? totalPrice,
    int? totalItems,
    String? paymentMethod,
    String? status,
    DateTime? createdAt,
    List<TransactionItemModel>? items,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
    );
  }
}
