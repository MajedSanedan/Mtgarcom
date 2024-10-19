import 'package:comestore/firebase/FireStorCategoryEdit.dart';
import 'package:comestore/firebase/FireStoreDelete.dart';
import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/firebase/FireStoreProductEdit.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:comestore/widgets/AdminProductCard.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class AdminProducstView extends StatefulWidget {
  AdminProducstView({super.key});

  @override
  State<AdminProducstView> createState() => _AdminProducstViewState();
}

class _AdminProducstViewState extends State<AdminProducstView> {
  List<ProductModel> products = [];
  FireStorProductEdit fireStoreEdit = FireStorProductEdit();
  FirestoreGet firestoreGet = FirestoreGet();

  bool isLoading = true;

  Future<void> getData() async {
    products = await firestoreGet.getProducts();
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
        : GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return AdminProductCard(
                productModel: products[index],
                onLongPress: () async {
                  fireStoreEdit.UpdatPr(context, products[index]);
                },
              );
            });
  }
}
