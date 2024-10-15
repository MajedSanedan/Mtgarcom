import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(imageUrl),
          )),
    );
  }
}
