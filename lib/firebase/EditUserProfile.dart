import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/AccountPage.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Edituserprofile {
  CollectionReference UserProfile =
      FirebaseFirestore.instance.collection('UserAddress');

  Future<void> UpdatUserAddress(
      context, UserAddressModel UserAddress, String email) async {
    // QuerySnapshot snapshot =
    //     await Categories.where('id', isEqualTo: category.id).get();
    // DocumentSnapshot doc = snapshot.docs.first;
    // String docId = doc.id;
    try {
      // جلب الوثائق التي تحتوي على categoryName
      QuerySnapshot snapshot =
          await UserProfile.where('email', isEqualTo: email).get();

      // التأكد أن هناك على الأقل وثيقة واحدة مطابقة
      if (snapshot.docs.isNotEmpty) {
        // جلب المعرّف والبيانات لأول وثيقة
        DocumentSnapshot doc = snapshot.docs.first;
        String docId = doc.id;

        // هنا نقوم بتحديث الوثيقة
        await UserProfile.doc(docId)
            .update({
              'name': UserAddress.name,
              'phone': UserAddress.phone,
              'address': UserAddress.address,
            })
            .then((value) {})
            .catchError((error) => print("Failed to update user: $error"));
        showDialog(
            context: context,
            builder: (context) {
              return CusttomDialog(
                  ok: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  icon: Icons.warning,
                  title: "تنبية",
                  Message: "تم التعديل بنجاح");
            });
      } else {
        // إذا لم يتم العثور على أي وثيقة
        print("No document found with the name ${UserAddress.name}");
      }
    } catch (e) {
      print("Error fetching or updating category: $e");
    }
  }
}
