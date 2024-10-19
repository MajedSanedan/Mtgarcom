import 'dart:ui';

import 'package:comestore/models/ProductModel.dart';
import 'package:flutter/material.dart';

class AdminProductCard extends StatelessWidget {
  const AdminProductCard(
      {super.key, required this.productModel, this.onLongPress});
  final ProductModel productModel;
  final Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Container(
        height: 150,
        width: 135,
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
              child:
                  (productModel.imageUrl == null || productModel.imageUrl == "")
                      ? Image.asset(
                          "assets/images/imagesProducts/mouse.png",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          productModel.imageUrl != null &&
                                  productModel.imageUrl.isNotEmpty
                              ? productModel.imageUrl
                              : 'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
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
      ),
    );
  }
}
