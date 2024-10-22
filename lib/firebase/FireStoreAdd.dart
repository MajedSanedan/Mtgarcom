import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreAdd {
  CollectionReference Categories =
      FirebaseFirestore.instance.collection('Categories');
  CollectionReference Products =
      FirebaseFirestore.instance.collection('Products');
  CollectionReference Cart = FirebaseFirestore.instance.collection('Cart');
  CollectionReference UserAddress =
      FirebaseFirestore.instance.collection('UserAddress');

  Future<void> AddCategories(CategoryModel category, context) async {
    return await Categories.doc(category.id).set({
      'name': category.name,
      'image': category.imageUrl,
      'id': category.id

      // Stokes and Sons
    }).then((value) {
      return showDialog(
          context: context,
          builder: (context) {
            return CusttomDialog(
                ok: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => MnaagmentCategoriesPage()),
                      (route) => false);
                },
                color: Colors.green,
                icon: Icons.check_circle,
                title: "تنبية",
                Message: "تمت الاضافة بنجاح");
          });
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> AddProduct(ProductModel product, context) async {
    // Call the user's CollectionReference to add a new user
    return await Products.doc(product.id).set({
      'id': product.id,
      'name': product.name,
      'imageUrl': product.imageUrl,
      'describtion': product.describtion,
      'price': product.price,
      'count': product.count,
      'category': product.category,
      'sllercount': 0,
    }).then((value) {
      return showDialog(
          context: context,
          builder: (context) {
            return CusttomDialog(
                ok: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ManagmentProductsPage()));
                },
                color: Colors.green,
                icon: Icons.check_circle,
                title: "تنبية",
                Message: "تمت الاضافة بنجاح");
          });
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> AddProductToCart(
      ProductModel product, int counter, context) async {
    // Call the user's CollectionReference to add a new user
    return await Cart.doc(product.id).set({
      'id': product.id,
      'name': product.name,
      'imageUrl': product.imageUrl,
      'describtion': product.describtion,
      'price': product.price,
      'count': product.count,
      'category': product.category,
      'sllercount': counter,
    }).then((value) {
      return showDialog(
          context: context,
          builder: (context) {
            return CusttomDialog(
                ok: () {
                  Navigator.pop(context);
                },
                color: Colors.green,
                icon: Icons.check_circle,
                title: "تنبية",
                Message: "تمت الاضافة بنجاح");
          });
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> AddUserAddress(UserAddressModel userAddress, context) async {
    // Call the user's CollectionReference to add a new user
    return await UserAddress.doc().set({
      'name': userAddress.name,
      'email': userAddress.email,
      'address': userAddress.address,
      'phone': userAddress.phone,
    }).then((value) {
      return showDialog(
          context: context,
          builder: (context) {
            return CusttomDialog(
                ok: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: Colors.green,
                icon: Icons.check_circle,
                title: "تنبية",
                Message: "تم التسجيل بنجاح");
          });
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
