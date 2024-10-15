import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/ProductView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(
          hintext: "الــــبــحــث في الأكثر مبيعا  ",
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
                title: "الأكثر مبيعا",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: ProductView())
            ],
          ),
        ),
      ),
    );
  }
}
