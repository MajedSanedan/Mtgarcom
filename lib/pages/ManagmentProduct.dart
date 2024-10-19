import 'package:comestore/pages/AddCategoryPage.dart';
import 'package:comestore/pages/AddProductPage.dart';
import 'package:comestore/widgets/AdminProductsView.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/ProductView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class ManagmentProductsPage extends StatelessWidget {
  const ManagmentProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(
          hintext: "الــــبــحــث في المنتجات   ",
        ),
      ),
      floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Color(0xffD9D9D9)),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddProductyPage()));
              },
              icon: Icon(
                Icons.add,
                color: Color(0xff1E1E1E),
                size: 30,
              ))),
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
              Expanded(child: AdminProducstView())
            ],
          ),
        ),
      ),
    );
  }
}
