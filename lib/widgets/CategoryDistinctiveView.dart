import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/widgets/CategoryDistinctiveCard.dart';
import 'package:flutter/material.dart';

class CategoryDistinctiveView extends StatefulWidget {
  CategoryDistinctiveView({
    super.key,
  });

  @override
  State<CategoryDistinctiveView> createState() =>
      _CategoryDistinctiveViewState();
}

class _CategoryDistinctiveViewState extends State<CategoryDistinctiveView> {
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
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Categories.length,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryDistinctiveCard(category: Categories[index]),
          );
        });
  }
}
