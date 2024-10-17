import 'package:comestore/firebase/Auth.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/HomePage.dart';
import 'package:comestore/pages/PasswordVerificationPage.dart';
import 'package:comestore/pages/RegisterPage.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLoading = false;

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  late UserModel userModel;
  final UserAuth userAuth = UserAuth();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "متـــــــــــــــجـــــــــــــر  كــــــــــــــــوم ",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: isLoading
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Container(
                      height: 216.5,
                      width: 216.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/Logo.png",
                              )),
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    MainTitle(
                      title: "تـــــســـجـــيـــل الــــدخــــول",
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "يرجى ملء البريد الإلكتروني أو رقم الهاتف وكلمة المرور لتسجيل الدخول إلى حسابك",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 351,
                      height: 220.94,
                      decoration: BoxDecoration(
                          color: const Color(0xffe8e8e8),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 20, top: 12, bottom: 12),
                        child: Form(
                          key: formstate,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FieldInfo(
                                label: "رقم الجوال او البريد الإلكتروني",
                                textedcontroller: email,
                                validator: (val) {
                                  if (val == "") {
                                    return "لايمكنك تركه فارغا";
                                  }
                                },
                              ),
                              FieldInfo(
                                  label: "كلمة المرور",
                                  textedcontroller: password,
                                  validator: (val) {
                                    if (val == "") {
                                      return "لايمكنك تركه فارغا";
                                    }
                                  }),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordVerificationPage()));
                                },
                                child: Text(
                                  "نسيت كلمة المرور؟",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: "IBM Plex Sans Arabic",
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
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
                            isLoading = true;
                          });
                          userModel = await UserModel(
                              email: email.text, passowrd: password.text);

                          await userAuth.Login(userModel, context);

                          isLoading = false;
                        } else {
                          print("Can not be empty");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomButton(
                      text: "التسجيل بواسطة حساب جوجل",
                      ontap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await userAuth.signInWithGoogle(context);
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Center(
                        child: Text(
                          "إنشاء حساب",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontFamily: "IBM Plex Sans Arabic",
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
