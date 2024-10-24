import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/widgets/CategoryCard.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:flutter/material.dart';

class CategoryVew extends StatefulWidget {
  CategoryVew({
    super.key,
  });

  @override
  State<CategoryVew> createState() => _CategoryVewState();
}

class _CategoryVewState extends State<CategoryVew> {
  List<CategoryModel> Categories = [];

  FirestoreGet firestoreGet = FirestoreGet();

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

  // final List<CategoryModel> Categories = [
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : ListView.builder(
            itemCount: Categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CategoryCard(categoryModel: Categories[index]),
              );
            });
  }
}
