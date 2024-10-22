import 'dart:math';

import 'package:comestore/firebase/FireStoreAdd.dart';
import 'package:comestore/firebase/FireStorgeUpLoad.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

int generateRandomInt(int max) {
  Random random = Random();
  return random.nextInt(max); // يولد رقمًا عشوائيًا بين 0 و max-1
}

class AddProductyPage extends StatefulWidget {
  AddProductyPage({super.key});

  @override
  State<AddProductyPage> createState() => _AddProductyPageState();
}

class _AddProductyPageState extends State<AddProductyPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController describtion = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController count = TextEditingController();

  final TextEditingController category = TextEditingController();

  late ProductModel productModel =
      ProductModel(name: "", imageUrl: "", price: 0);

  final FireStoreAdd product = FireStoreAdd();

  FireStorgeUpLoad fireStorgeUpLoad = FireStorgeUpLoad();

  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
        style: TextStyle(fontSize: 20),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "إضــــــافـــة مــنــتــج جــديـــد",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 351,
                height: 550.54,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: Form(
                    key: formstate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FieldInfo(
                            label: "أسم المنتج",
                            textedcontroller: name,
                            validator: (val) {
                              if (val == "") {
                                return "لايمكنك تركه فارغا";
                              }
                            }),
                        FieldInfo(
                          label: "الوصف",
                          textedcontroller: describtion,
                          validator: (val) {
                            if (val == "") {
                              return "لايمكنك تركه فارغا";
                            }
                          },
                          maxline: 3,
                          hieght: 100,
                        ),
                        FieldInfo(
                            label: "السعر",
                            textedcontroller: price,
                            validator: (val) {
                              if (val == "") {
                                return "لايمكنك تركه فارغا";
                              }
                            }),
                        FieldInfo(
                            label: "الكمية",
                            textedcontroller: count,
                            validator: (val) {
                              if (val == "") {
                                return "لايمكنك تركه فارغا";
                              }
                            }),
                        FieldInfo(
                            label: "القسم",
                            textedcontroller: category,
                            validator: (val) {
                              if (val == "") {
                                return "لايمكنك تركه فارغا";
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: CustomButton(
                            backgroundcolor: Color(0xffFFFFFF),
                            textcolor: Color(0xff1E1E1E),
                            text: "... أخـــتـــيار صورة",
                            ontap: () async {
                              imageUrl =
                                  await fireStorgeUpLoad.getImage(imageUrl);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  text: "إضــــافـــة",
                  ontap: () async {
                    double price1 = double.parse(price.text);
                    int cont1 = int.parse(price.text);
                    productModel = ProductModel(
                        id: generateRandomInt(1000).toString(),
                        name: name.text,
                        imageUrl: imageUrl,
                        describtion: describtion.text,
                        price: price1,
                        category: category.text,
                        count: cont1);

                    await product.AddProduct(productModel, context);
                    setState(() {
                      isLoading = false;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
