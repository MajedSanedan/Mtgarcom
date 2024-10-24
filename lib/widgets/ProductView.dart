import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/ProductPage.dart';
import 'package:comestore/widgets/AdminProductCard.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key, this.nameCategory});
  final String? nameCategory;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<ProductModel> products = [];

  FirestoreGet firestoreGet = FirestoreGet();

  bool isLoading = true;

  Future<void> getData() async {
    products = await firestoreGet.getProductsWithCategory(widget.nameCategory!);
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
              return ProductCard(
                productModel: products[index],
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductPage(
                            productModel: products[index],
                          )));
                },
              );
            });
  }
}
