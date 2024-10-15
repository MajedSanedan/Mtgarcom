import 'package:comestore/models/ProductModel.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
              widget.productModel.imageUrl,
              // height: 80,
              // width: 124,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              height: 35,
              // width: 124,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xff1E1E1E),
                    ),
                    child: Column(
                      children: [
                        const Text("السعر",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                        Text("${widget.productModel.price}\$",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(widget.productModel.name,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.productModel.count--;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 18,
                    ),
                  ),
                  Text(
                    widget.productModel.count.toString(),
                    style: const TextStyle(
                        color: Color(0xff1E1E1E),
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.productModel.count++;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                  const Text(":الــعــدد ",
                      style: TextStyle(
                          color: Color(0xff1E1E1E),
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
