import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  final List<ProductModel> products = [
    ProductModel(
        name: "ماوس لاسلكي",
        imageUrl: "assets/images/imagesProducts/mouse.png",
        price: 11.5),
    ProductModel(
        name: "حقائب سفر  ",
        imageUrl: "assets/images/imagesProducts/bags.png",
        price: 11.5),
    ProductModel(
        name: " أديداس تريفويل",
        imageUrl:
            "assets/images/imagesProducts/AdidasOriginalsTrefoilHoodie.png",
        price: 11.5),
    ProductModel(
        name: "أديداس غازيل",
        imageUrl: "assets/images/imagesProducts/AdidasGazelle.png",
        price: 11.5),
    ProductModel(
        name: "أديداس سينشالز",
        imageUrl:
            "assets/images/imagesProducts/AdidasEssentialsFleeceSweatshirt.png",
        price: 11.5),
    ProductModel(
        name: "جاكيت تدريب ",
        imageUrl:
            "assets/images/imagesProducts/AdidasCondivo22TrainingJacket.png",
        price: 11.5),
    ProductModel(
        name: " أديداس أديليت",
        imageUrl: "assets/images/imagesProducts/AdidasAdiletteSlides.png",
        price: 11.5),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return ProductCard(productModel: products[index]);
        });
  }
}
