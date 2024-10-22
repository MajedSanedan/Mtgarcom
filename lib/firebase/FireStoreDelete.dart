import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/CartPage.dart';
import 'package:comestore/pages/HomePage.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:flutter/material.dart';

class FireStoreDelete {
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  CollectionReference categories =
      FirebaseFirestore.instance.collection('Categories');
  CollectionReference Cart = FirebaseFirestore.instance.collection('Cart');

  Future<void> DeleteProduct(context, ProductModel product) async {
    showDialog(
        context: context,
        builder: (context) {
          return CusttomDialog(
              ok: () async {
                await products
                    .doc(product.id)
                    .delete()
                    .then((value) {})
                    .catchError(
                        (error) => print("Failed to delete user: $error"));

                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ManagmentProductsPage()));
              },
              color: Colors.red,
              icon: Icons.warning,
              title: "تحذيـــر",
              Message: "هل أنت متأكد من الحذف");
        });
  }

  Future<void> DeleteCategory(context, CategoryModel category) async {
    showDialog(
        context: context,
        builder: (context) {
          return CusttomDialog(
              ok: () async {
                await categories
                    .doc(category.id)
                    .delete()
                    .then((value) {})
                    .catchError(
                        (error) => print("Failed to delete user: $error"));

                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MnaagmentCategoriesPage()));
              },
              color: Colors.red,
              icon: Icons.warning,
              title: "تحذيـــر",
              Message: "هل أنت متأكد من الحذف");
        });
  }

  Future<void> DeleteProductFromCart(
    context,
    ProductModel product,
  ) async {
    showDialog(
        context: context,
        builder: (context) {
          return CusttomDialog(
              ok: () async {
                await Cart.doc(product.id).delete().then((value) {}).catchError(
                    (error) => print("Failed to delete user: $error"));

                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                          index: 1,
                        )));
              },
              color: Colors.red,
              icon: Icons.warning,
              title: "تحذيـــر",
              Message: "هل انت متأكد من الإزالة من السلة");
        });
  }
}
