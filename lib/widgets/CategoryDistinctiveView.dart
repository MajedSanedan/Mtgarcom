import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/widgets/CategoryDistinctiveCard.dart';
import 'package:flutter/material.dart';

class CategoryDistinctiveView extends StatelessWidget {
  const CategoryDistinctiveView({
    super.key,
  });
  final List<CategoryModel> Categories = const [
    CategoryModel(
      name: "الإلكترونيات",
      imagUrl: "assets/images/imageCategory/Electronics.png",
    ),
    CategoryModel(
      name: "الاثاث والديكور",
      imagUrl: "assets/images/imageCategory/Furniture.png",
    ),
    CategoryModel(
      name: "الدراسة",
      imagUrl: "assets/images/imageCategory/StudySupplies.png",
    ),
    CategoryModel(
      name: " العناية والجمال",
      imagUrl: "assets/images/imageCategory/Care_and_beauty.png",
    ),
    CategoryModel(
      name: "معدات",
      imagUrl: "assets/images/imageCategory/Equipment.png",
    ),
    CategoryModel(
      name: "ملابس رجالية",
      imagUrl: "assets/images/imageCategory/Men's_clothing.png",
    ),
    CategoryModel(
      name: "اواني",
      imagUrl: "assets/images/imageCategory/Utensils.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Categories.length,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryDistinctiveCard(category: Categories[index]),
          );
        });
  }
}
