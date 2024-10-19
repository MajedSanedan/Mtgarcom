import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/models/ProductModel.dart';

class FirestoreGet {
  Future<List<CategoryModel>> getCategories() async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Categories').get();

    // تحويل QuerySnapshot إلى قائمة من كائنات Product
    // List<CategoryModel> Categories = snapshot.docs.map((doc) {
    //   return CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
    List<CategoryModel> Categories = snapshot.docs.map((doc) {
      var category = CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
      category.id = doc.id; // إضافة الـ id إلى كائن ProductModel
      return category;
    }).toList();
    return Categories;
  }

  Future<List<ProductModel>> getProducts() async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Products').get();

    // تحويل QuerySnapshot إلى قائمة من كائنات Product
    // List<ProductModel> Products = snapshot.docs.map((doc) {
    //   return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
    List<ProductModel> products = snapshot.docs.map((doc) {
      var product = ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      product.id = doc.id; // إضافة الـ id إلى كائن ProductModel
      return product;
    }).toList();
    return products;
  }

  Future<List<CategoryModel>> getCategoriesWithName(String Name) async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .where('category', isEqualTo: Name)
        .get();

    // تحويل QuerySnapshot إلى قائمة من كائنات Product
    // List<CategoryModel> Categories = snapshot.docs.map((doc) {
    //   return CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
    List<CategoryModel> Categories = snapshot.docs.map((doc) {
      var category = CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
      category.id = doc.id; // إضافة الـ id إلى كائن ProductModel
      return category;
    }).toList();
    return Categories;
  }

  Future<List<ProductModel>> getProductsWithCategory(String name) async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('category', isEqualTo: name)
        .get();

    // تحويل QuerySnapshot إلى قائمة من كائنات Product
    // List<ProductModel> Products = snapshot.docs.map((doc) {
    //   return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
    List<ProductModel> products = snapshot.docs.map((doc) {
      var product = ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      product.id = doc.id; // إضافة الـ id إلى كائن ProductModel
      return product;
    }).toList();
    return products;
  }
}
