import 'package:comestore/firebase/FireStoreAdd.dart';
import 'package:comestore/firebase/FireStoreProductEdit.dart';
import 'package:comestore/models/ProductModel.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/firebase/FireStorgeUpLoad.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  EditProductPage({super.key, required this.Products});
  final ProductModel Products;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController name = TextEditingController();

  final TextEditingController describtion = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController count = TextEditingController();

  final TextEditingController category = TextEditingController();
  final TextEditingController saller = TextEditingController();

  late ProductModel productModel;
  FireStorgeUpLoad fireStorgeUpLoad = FireStorgeUpLoad();
  String imageUrl = "";

  final FireStorProductEdit productEdit = FireStorProductEdit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.Products.name;
    describtion.text = widget.Products.describtion!;
    price.text = widget.Products.price.toString();
    count.text = widget.Products.count.toString();
    saller.text = widget.Products.sllercount.toString();
    category.text = widget.Products.category!;
    imageUrl = widget.Products.imageUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
        style: TextStyle(fontSize: 20),
      )),
      body: isLoading
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MainTitle(
                      title: "تــــعــديــل مـــنــتــج",
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 351,
                      height: 620.54,
                      decoration: BoxDecoration(
                          color: const Color(0xffe8e8e8),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 20, top: 20, bottom: 20),
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
                              FieldInfo(
                                  label: "عدد المبيعات",
                                  textedcontroller: saller,
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
                                    imageUrl = await fireStorgeUpLoad
                                        .getImage(imageUrl);
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
                        text: "تــعـــديـــل",
                        ontap: () async {
                          double price1 = double.parse(price.text);
                          int cont1 = int.parse(count.text);
                          int saller1 = int.parse(saller.text);
                          productModel = ProductModel(
                              name: name.text,
                              imageUrl: imageUrl,
                              describtion: describtion.text,
                              price: price1,
                              category: category.text,
                              count: cont1,
                              sllercount: saller1);

                          await productEdit.UpdatProduct(context, productModel);
                        })
                  ],
                ),
              ),
            ),
    );
  }
}
