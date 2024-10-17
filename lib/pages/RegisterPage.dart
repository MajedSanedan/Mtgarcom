import 'package:comestore/firebase/Auth.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/HomePage.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool IsLoading = false;
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  late UserModel userModel;
  final UserAuth userAuth = UserAuth();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    userAuth.State();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "متـــــــــــــــجـــــــــــــر  كــــــــــــــــوم ",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: IsLoading
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  //  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MainTitle(
                      title: "إنشاء حساب جديد",
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "هل لديك حساب بالفعل؟ ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 351,
                      height: 352.54,
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
                                  label: "الاسم",
                                  textedcontroller: name,
                                  validator: (val) {
                                    if (val == "") {
                                      return "لايمكنك تركه فارغا";
                                    }
                                  }),
                              FieldInfo(
                                  label: "البريد الإلكتروني",
                                  textedcontroller: email,
                                  validator: (val) {
                                    if (val == "") {
                                      return "لايمكنك تركه فارغا";
                                    }
                                  }),
                              FieldInfo(
                                  label: "كلمة المرور",
                                  textedcontroller: password,
                                  validator: (val) {
                                    if (val == "") {
                                      return "لايمكنك تركه فارغا";
                                    }
                                  }),
                              FieldInfo(
                                  label: "تاكيد كلمة المرور",
                                  textedcontroller: password,
                                  validator: (val) {
                                    if (val == "") {
                                      return "لايمكنك تركه فارغا";
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    CustomButton(
                      text: "تسجيل الدخول",
                      ontap: () async {
                        if (formstate.currentState!.validate()) {
                          setState(() {
                            IsLoading = true;
                          });
                          userModel = UserModel(
                              name: name.text,
                              email: email.text,
                              passowrd: password.text);

                          await userAuth.Register(userModel);
                          IsLoading = false;
                          userAuth.SendEmailVerify();

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
