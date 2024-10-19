import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comestore/firebase/FireStorCategoryEdit.dart';
import 'package:comestore/firebase/FireStoreAdd.dart';
import 'package:comestore/models/CategoryModel.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class EditCategoryPage extends StatefulWidget {
  EditCategoryPage({super.key, this.CategorOld});
  CategoryModel? CategorOld;
  @override
  State<EditCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<EditCategoryPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  late CategoryModel categoryModel;

  final FireStorCategoryEdit Category = FireStorCategoryEdit();

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.CategorOld!.name;
  }

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
                      title: "تـــعـــديــــل قـــســـــم",
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
                                  ontap: () {},
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
                        text: "تـــعـــديـــل",
                        ontap: () async {
                          setState(() {
                            isLoading = true;
                            categoryModel = CategoryModel(
                              name: name.text,
                              //imagUrl: "imagUrl"
                            );
                          });

                          await Category.UpdatCategory(context, categoryModel);
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
