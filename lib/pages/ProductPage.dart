import 'package:comestore/firebase/FireStoreAdd.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 1;
  FireStoreAdd fireStoreAdd = FireStoreAdd();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
          style: TextStyle(fontSize: 20),
        ),
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
                        image: (widget.productModel.imageUrl == null ||
                                widget.productModel.imageUrl == "")
                            ? AssetImage(
                                "assets/images/imageCategory/Electronics.png")
                            : NetworkImage(widget.productModel.imageUrl!)),
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  widget.productModel.describtion!,
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
                      onPressed: () {
                        counter--;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style: TextStyle(
                          color: Color(0xff1E1E1E),
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        counter++;
                        setState(() {});
                      },
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
                  child: Center(
                    child: Text(
                        (widget.productModel.price * counter).toString(),
                        style: TextStyle(
                            color: Color(0xff1E1E1E),
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  )),
              CustomButton(
                  text: "إضافة إلى السلة",
                  ontap: () async {
                    fireStoreAdd.AddProductToCart(
                        widget.productModel, counter, context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
