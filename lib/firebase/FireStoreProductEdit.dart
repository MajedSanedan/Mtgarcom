import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/firebase/FireStoreDelete.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/EditCategoryPage.dart';
import 'package:comestore/pages/EditProduct.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:flutter/material.dart';

class FireStorProductEdit {
  CollectionReference Products =
      FirebaseFirestore.instance.collection('Products');

  FireStoreDelete fireStoreDelete = FireStoreDelete();
  Future<void> UpdatPr(context, ProductModel product) async {
    showDialog(
        context: context,
        builder: (context) {
          return CusttomDialog(
              ok: () {
                fireStoreDelete.DeleteProduct(context, product);
              },
              edit: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProductPage(
                              Products: product,
                            )));
              },
              color: Colors.red,
              icon: Icons.warning,
              title: "تنبية",
              Message: "أختر الاجراء المناسب");
        });
  }

  Future<void> UpdatProduct(context, ProductModel product) async {
    // QuerySnapshot snapshot =
    //     await Categories.where('id', isEqualTo: category.id).get();
    // DocumentSnapshot doc = snapshot.docs.first;
    // String docId = doc.id;
    try {
      // جلب الوثائق التي تحتوي على categoryName
      QuerySnapshot snapshot =
          await Products.where('id', isEqualTo: product.id).get();

      // التأكد أن هناك على الأقل وثيقة واحدة مطابقة
      if (snapshot.docs.isNotEmpty) {
        // جلب المعرّف والبيانات لأول وثيقة
        DocumentSnapshot doc = snapshot.docs.first;
        String docId = doc.id;

        // هنا نقوم بتحديث الوثيقة
        await Products.doc(docId)
            .update({
              'name': product.name,
              'imageUrl': product.imageUrl,
              'describtion': product.describtion,
              'price': product.price,
              'count': product.count,
              'category': product.category,
              'sllercount': product.sllercount,
              'sallercount': 0,
            })
            .then((value) {})
            .catchError((error) => print("Failed to update user: $error"));
        showDialog(
            context: context,
            builder: (context) {
              return CusttomDialog(
                  ok: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManagmentProductsPage()));
                  },
                  color: Colors.green,
                  icon: Icons.warning,
                  title: "تنبية",
                  Message: "تم التعديل بنجاح");
            });
      } else {
        // إذا لم يتم العثور على أي وثيقة
        print("No document found with the name ${product.name}");
      }
    } catch (e) {
      print("Error fetching or updating category: $e");
    }
  }
}
