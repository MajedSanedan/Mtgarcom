import 'package:comestore/firebase/FireStoreDelete.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:flutter/material.dart';

FireStoreDelete fireStoreDelete = FireStoreDelete();

class ProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final String? describtion;
  int? sllercount;
  final String? category;
  int count;
  String? id;

  ProductModel(
      {required this.name,
      required this.imageUrl,
      required this.price,
      this.count = 1,
      this.describtion,
      this.category,
      this.sllercount,
      this.id});

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'],
      imageUrl: data["imageUrl"],
      describtion: data["describtion"],
      price: data["price"],
      count: data["count"],
      category: data["category"],
      sllercount: data["sllercount"],
    );
  }
}
