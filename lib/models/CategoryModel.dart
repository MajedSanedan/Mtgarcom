import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CategoryModel {
  final String name;
  String? imageUrl;
  String? id;

  CategoryModel({required this.name, this.imageUrl, this.id});
  // factory CategoryModel() {

  // }
  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      name: data['name'],
      imageUrl: data["image"],
    );
  }
  // دالة toMap لتحويل كائن CategoryModel إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagUrl': imageUrl,
    };
  }
}
