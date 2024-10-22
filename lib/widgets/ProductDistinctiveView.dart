import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/ProductPage.dart';
import 'package:comestore/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductDistinctiVeview extends StatefulWidget {
  ProductDistinctiVeview(
      {super.key,
      this.axis = Axis.horizontal,
      this.across = 1,
      required this.reverse});
  Axis? axis;
  int? across;
  final bool reverse;
  @override
  State<ProductDistinctiVeview> createState() => _ProductDistinctiVeviewState();
}

class _ProductDistinctiVeviewState extends State<ProductDistinctiVeview> {
  List<ProductModel> products = [];

  FirestoreGet firestoreGet = FirestoreGet();

  bool isLoading = true;

  Future<void> getData() async {
    products = await firestoreGet.getBestSallerProducts();
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
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.across!),
            itemCount: products.length,
            scrollDirection: widget.axis!,
            reverse: widget.reverse,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  productModel: products[index],
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(productModel: products[index])));
                  },
                ),
              );
            });
  }
}
