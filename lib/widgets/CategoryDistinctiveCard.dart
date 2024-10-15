import 'package:comestore/models/CategoryModel.dart';
import 'package:flutter/material.dart';

class CategoryDistinctiveCard extends StatelessWidget {
  const CategoryDistinctiveCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(category.imagUrl))),
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          height: 20,
          width: 90,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(3)),
          child: Center(
            child: Text(
              category.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "IBM Plex Sans Arabic",
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
