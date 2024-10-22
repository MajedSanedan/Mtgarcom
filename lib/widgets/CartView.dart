import 'dart:async';

import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/CartInfo.dart';
import 'package:comestore/widgets/CartItem.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:flutter/material.dart';

double totalprice = 10;

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<ProductModel> products = [];

  FirestoreGet firestoreGet = FirestoreGet();

  bool isLoading = true;
  double total = 0;

  Future<void> getData() async {
    products = await firestoreGet.getItemsFromCart();
    setState(() {
      isLoading = false;
    });
  }

  getTotalPrice() {
    totalprice = 0;
    for (int i = 0; i < products.length; i++) {
      totalprice += products[i].price * products[i].sllercount!.toDouble();
      setState(() {});
    }
    return totalprice;
  }

  @override
  void initState() {
    getTotalPrice();
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return CartItem(productModel: products[index]);
              }),
        ),
        CustomButton(
            text: "احسب السعر لاجمالي",
            ontap: () {
              getTotalPrice();
            }),
        const SizedBox(
          height: 20,
        ),
        CartInfo(totalPrice: getTotalPrice(), count: products.length)
      ],
    );
  }
}
