import 'package:comestore/pages/AddCategoryPage.dart';
import 'package:comestore/widgets/AdminCategoryview.dart';
import 'package:comestore/widgets/CategoryVew.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class MnaagmentCategoriesPage extends StatelessWidget {
  const MnaagmentCategoriesPage({super.key});

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
      floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Color(0xffD9D9D9)),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddCategoryPage()));
              },
              icon: Icon(
                Icons.add,
                color: Color(0xff1E1E1E),
                size: 30,
              ))),
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
            Expanded(child: AdminCategoryView())
          ],
        ),
      ),
    );
  }
}
