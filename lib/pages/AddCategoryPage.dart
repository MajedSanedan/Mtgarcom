import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/firebase/FireStoreAdd.dart';
import 'package:comestore/firebase/FireStorgeUpLoad.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

int generateRandomInt(int max) {
  Random random = Random();
  return random.nextInt(max); // يولد رقمًا عشوائيًا بين 0 و max-1
}

class AddCategoryPage extends StatefulWidget {
  AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  late CategoryModel categoryModel = CategoryModel(name: "name");

  final FireStoreAdd Category = FireStoreAdd();

  bool isLoading = false;
  FireStorgeUpLoad fireStorgeUpLoad = FireStorgeUpLoad();
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "مــتـجـر كـــــوم ",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: isLoading
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MainTitle(
                      title: "إضــــــافـــة قــســم جــديـــد",
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 351,
                      height: 180.54,
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
                                  label: "أسم القسم",
                                  textedcontroller: name,
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
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "إضــــافـــة",
                        ontap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          categoryModel = CategoryModel(
                            id: generateRandomInt(1000).toString(),
                            name: name.text,
                            imageUrl: imageUrl,
                          );
                          Category.AddCategories(categoryModel, context);
                          setState(() {
                            isLoading = false;
                          });
                        }),
                    // (categoryModel.imageUrl != null ||
                    //         categoryModel.imageUrl != "")
                    //     ? Container(
                    //         height: 77.84,
                    //         width: 79.3,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(7),
                    //             image: DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image:
                    //                     NetworkImage(categoryModel.imageUrl!))),
                    //       )
                    //     : SizedBox(),
                  ],
                ),
              ),
            ),
    );
  }
}
