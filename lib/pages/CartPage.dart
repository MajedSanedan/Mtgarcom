import 'package:comestore/widgets/CartView.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(
          hintext: "الــــبــحــث في الـــــــــســـلـــــة   ",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "الـــــــــــــســـــــــــلـــــــــــــة",
                ontap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: CartView()),
              SizedBox(
                height: 16,
              ),
              // CartInfo()
            ],
          ),
        ),
      ),
    );
  }
}
