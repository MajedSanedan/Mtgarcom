import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/CartInfo.dart';
import 'package:comestore/widgets/CartItem.dart';
import 'package:flutter/material.dart';

double totalprice = 10;

class CartView extends StatelessWidget {
  CartView({super.key});
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
        price: 20.5),
  ];
  getTotalPrice(List<ProductModel> price) {
    for (int i = 0; i < price.length; i++) {
      totalprice += price[i].price * price[i].count;
    }
    return totalprice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return CartItem(productModel: products[index]);
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        CartInfo(totalPrice: getTotalPrice(products), count: products.length)
      ],
    );
  }
}
