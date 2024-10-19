import 'dart:ffi';

import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/pages/ManagmentProduct.dart';
import 'package:flutter/material.dart';

class AdminCategoryCard extends StatelessWidget {
  const AdminCategoryCard(
      {super.key, required this.categoryModel, this.onLongPress});
  final CategoryModel categoryModel;
  final Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onLongPress: onLongPress,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ManagmentProductsPage()));
          },
          child: Container(
            height: 77.84,
            width: 262.41,
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(7)),
            child: Center(
              child: Text(
                categoryModel.name,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff1E1E1E),
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 77.84,
          width: 79.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (categoryModel.imageUrl == null ||
                          categoryModel.imageUrl == "")
                      ? AssetImage(
                          "assets/images/imageCategory/Electronics.png")
                      : NetworkImage(categoryModel.imageUrl!))),
        )
      ],
    );
  }
}
