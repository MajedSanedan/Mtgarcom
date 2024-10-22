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
          title: Text(
        "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
        style: TextStyle(fontSize: 20),
      )),
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
