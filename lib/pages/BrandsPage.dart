import 'package:comestore/widgets/BrandView.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(
          hintext: "الــــبــحــث في العلامات التجارية ",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "العلامات التجارية",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(child: BrandView())
            ],
          ),
        ),
      ),
    );
  }
}
