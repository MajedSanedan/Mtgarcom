import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductDistinctiVeview extends StatelessWidget {
  ProductDistinctiVeview({
    super.key,
  });
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
    return ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductCard(productModel: products[index]),
          );
        });
  }
}
