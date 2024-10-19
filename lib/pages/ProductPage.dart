import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text(" مــتـجـر كـــــــــــــوم - المــــــنـــتجـــــات "),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "تفاصيل المنتج",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250.36,
                width: 351,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: (productModel.imageUrl == null ||
                                productModel.imageUrl == "")
                            ? AssetImage(
                                "assets/images/imageCategory/Electronics.png")
                            : NetworkImage(productModel.imageUrl!)),
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  productModel.describtion!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "الكمية",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: 138.06,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    const Text(
                      "3",
                      style: TextStyle(
                          color: Color(0xff1E1E1E),
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "السعر الاجمالي",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                  width: 138.06,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xffe8e8e8),
                      borderRadius: BorderRadius.circular(3)),
                  child: const Center(
                    child: Text("34\$",
                        style: TextStyle(
                            color: Color(0xff1E1E1E),
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
