import 'package:comestore/widgets/BrandCard.dart';
import 'package:flutter/material.dart';

class BrandView extends StatelessWidget {
  const BrandView({super.key});
  final List<String> BrandImages = const [
    "assets/images/ImageBrand/garnier.jpg",
    "assets/images/ImageBrand/ikea.jpeg",
    "assets/images/ImageBrand/nike.png",
    "assets/images/ImageBrand/samsung.png",
    "assets/images/ImageBrand/total.webp",
    "assets/images/ImageBrand/Adidas.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.builder(
          itemCount: BrandImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 22,
          ),
          itemBuilder: (Context, index) {
            return BrandCard(imageUrl: BrandImages[index]);
          }),
    );
  }
}
