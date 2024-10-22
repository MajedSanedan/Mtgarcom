import 'package:comestore/models/SectionHomeModel.dart';
import 'package:comestore/pages/BestSellerPage.dart';
import 'package:comestore/pages/BrandsPage.dart';
import 'package:comestore/pages/CategoriesPage.dart';
import 'package:comestore/pages/OffersPage.dart';
import 'package:comestore/widgets/SectionHome.dart';
import 'package:flutter/material.dart';

class SectionHomeView extends StatelessWidget {
  SectionHomeView({
    super.key,
  });

  final List<SectionHomeModel> itemSectionHom = [
    SectionHomeModel(
      name: "العلامات التجارية",
      imageIcon: "assets/images/imageIcons/Trademark.png",
    ),
    SectionHomeModel(
        name: "الأكثر مبيعا", imageIcon: "assets/images/imageIcons/Crown.png"),
    SectionHomeModel(
        name: "العروض", imageIcon: "assets/images/imageIcons/Discount.png"),
    SectionHomeModel(
        name: "الأقسام الرئيسية ",
        imageIcon: "assets/images/imageIcons/Category.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SectionHome(
          model: itemSectionHom[0],
          ontap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BrandsPage()));
          },
        ),
        const Spacer(
          flex: 1,
        ),
        SectionHome(
          model: itemSectionHom[1],
          ontap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BestSellerPage()));
          },
        ),
        const Spacer(
          flex: 1,
        ),
        SectionHome(
          model: itemSectionHom[2],
          ontap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OffersPage()));
          },
        ),
        const Spacer(
          flex: 1,
        ),
        SectionHome(
          model: itemSectionHom[3],
          ontap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesPage()));
          },
        )
      ],
    );
  }
}
