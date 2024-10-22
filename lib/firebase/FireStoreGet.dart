import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<List<ProductModel>> getBestSallerProducts() async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('sllercount', isGreaterThan: 0)
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

  Future<List<ProductModel>> getItemsFromCart() async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Cart').get();

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

  Future<List<ProductModel>> getProductsSearch(String wordSearch) async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('name', isGreaterThanOrEqualTo: wordSearch)
        .where('name', isLessThanOrEqualTo: wordSearch + '\uf8ff')
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

  // Future<List<UserModel>> getUser() async {
  //   // اجلب البيانات من Firestore
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('User').get();

  //   // تحويل QuerySnapshot إلى قائمة من كائنات Product
  //   // List<ProductModel> Products = snapshot.docs.map((doc) {
  //   //   return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
  //   List<UserModel> Users = snapshot.docs.map((doc) {
  //     var users = UserModel.fromMap(doc.data() as Map<String, dynamic>);
  //     // إضافة الـ id إلى كائن ProductModel
  //     return users;
  //   }).toList();
  //   return Users;
  // }
  Future<UserAddressModel> getUserAddress(String email) async {
    // اجلب البيانات من Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('UserAddress')
        .where('email', isEqualTo: email)
        .get();

    // التحقق من أن هناك بيانات في الـ snapshot

    // تحويل أول مستند إلى كائن UserModel
    if (snapshot.docs.isNotEmpty) {
      UserAddressModel user = UserAddressModel.fromMap(
          snapshot.docs.first.data() as Map<String, dynamic>);
      return user;
    } else {
      return UserAddressModel();
    }
  }
}
