import 'dart:ui';

import 'package:comestore/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111,
      width: 124,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            width: 1,
            color: Color(0xffe8e8e8),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.asset(
              productModel.imageUrl,
              // height: 80,
              // width: 124,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              height: 30,
              // width: 124,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xff1E1E1E),
                    ),
                    child: Column(
                      children: [
                        const Text("السعر",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                        Text("${productModel.price}\$",
                            style: const TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(productModel.name,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
