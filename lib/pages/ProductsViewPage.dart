import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/ProductView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class ProductsViewPage extends StatelessWidget {
  const ProductsViewPage({super.key, this.nameCategory});
  final String? nameCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
        style: TextStyle(fontSize: 20),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "الـــــمــــنـــــتـــجات",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ProductView(
                nameCategory: nameCategory,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
