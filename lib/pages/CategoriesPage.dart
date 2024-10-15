import 'package:comestore/widgets/CategoryVew.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            // Text(" مــتـجـر كـــــــــــــوم - الأقسام"),
            SearchTextField(
              hintext: "الــــبــحــث في الأقسام الرائيسية",
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            MainTitle(
              title: "الأقسام الرئيسية",
              ontap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: CategoryVew())
          ],
        ),
      ),
    );
  }
}
