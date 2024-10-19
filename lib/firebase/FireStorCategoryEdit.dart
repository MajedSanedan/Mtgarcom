import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/firebase/FireStoreDelete.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/pages/EditCategoryPage.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:flutter/material.dart';

class FireStorCategoryEdit {
  CollectionReference Categories =
      FirebaseFirestore.instance.collection('Categories');

  FireStoreDelete fireStoreDelete = FireStoreDelete();
  Future<void> Updat(context, CategoryModel category) async {
    showDialog(
        context: context,
        builder: (context) {
          return CusttomDialog(
              ok: () {
                fireStoreDelete.DeleteCategory(context, category);
              },
              edit: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditCategoryPage(
                              CategorOld: category,
                            )));
              },
              color: Colors.red,
              icon: Icons.warning,
              title: "تنبية",
              Message: "أختر الاجراء المناسب");
        });
  }

  Future<void> UpdatCategory(context, CategoryModel category) async {
    // QuerySnapshot snapshot =
    //     await Categories.where('id', isEqualTo: category.id).get();
    // DocumentSnapshot doc = snapshot.docs.first;
    // String docId = doc.id;
    try {
      // جلب الوثائق التي تحتوي على categoryName
      QuerySnapshot snapshot =
          await Categories.where('id', isEqualTo: category.id).get();

      // التأكد أن هناك على الأقل وثيقة واحدة مطابقة
      if (snapshot.docs.isNotEmpty) {
        // جلب المعرّف والبيانات لأول وثيقة
        DocumentSnapshot doc = snapshot.docs.first;
        String docId = doc.id;

        // هنا نقوم بتحديث الوثيقة
        await Categories.doc(docId)
            .update({
              'name': category.name,
              'image': category.imageUrl,
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
                            builder: (context) => MnaagmentCategoriesPage()));
                  },
                  color: Colors.green,
                  icon: Icons.warning,
                  title: "تنبية",
                  Message: "تم التعديل بنجاح");
            });
      } else {
        // إذا لم يتم العثور على أي وثيقة
        print("No document found with the name ${category.name}");
      }
    } catch (e) {
      print("Error fetching or updating category: $e");
    }
  }
}
