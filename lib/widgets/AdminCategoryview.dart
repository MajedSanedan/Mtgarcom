import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/firebase/FireStorCategoryEdit.dart';
import 'package:comestore/firebase/FireStoreDelete.dart';
import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/widgets/AdminCateogryCard.dart';
import 'package:comestore/widgets/CategoryCard.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:flutter/material.dart';

class AdminCategoryView extends StatefulWidget {
  const AdminCategoryView({
    super.key,
  });

  @override
  State<AdminCategoryView> createState() => _AdminCategoryViewState();
}

class _AdminCategoryViewState extends State<AdminCategoryView> {
  List<CategoryModel> Categories = [];
  FirestoreGet firestoreGet = FirestoreGet();
  FireStorCategoryEdit fireStoreEdit = FireStorCategoryEdit();
  bool isLoading = true;
  Future<void> getData() async {
    Categories = await firestoreGet.getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : ListView.builder(
            itemCount: Categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AdminCategoryCard(
                  categoryModel: Categories[index],
                  onLongPress: () {
                    fireStoreEdit.Updat(context, Categories[index]);
                  },
                ),
              );
            });
  }
}
