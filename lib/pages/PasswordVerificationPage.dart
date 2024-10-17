import 'package:comestore/firebase/Auth.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class PasswordVerificationPage extends StatefulWidget {
  PasswordVerificationPage({super.key});

  @override
  State<PasswordVerificationPage> createState() =>
      _PasswordVerificationPageState();
}

class _PasswordVerificationPageState extends State<PasswordVerificationPage> {
  final TextEditingController email = TextEditingController();

  final UserAuth userAuth = UserAuth();

  bool isLoading = false;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MainTitle(
                      title: "إعادة تعين كلمة المرور",
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      textAlign: TextAlign.end,
                      "ادخل عنوان بريدك الإلكتروني وسنرل لك رابط لإعادة تعين كلمة المرور",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 351,
                      height: 118.62,
                      decoration: BoxDecoration(
                          color: const Color(0xffe8e8e8),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 20, top: 20, bottom: 20),
                        child: FieldInfo(
                          label: " البريد الإلكتروني",
                          textedcontroller: email,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    CustomButton(
                      text: "إرســــــــــــــال",
                      ontap: () async {
                        if (email.text == "") {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CusttomDialog(
                                icon: Icons.warning,
                                title: "خـــطاء",
                                Message: "الرجاء إدخال بريدك الإلكتروني",
                                color: Colors.red,
                              );
                            },
                          );
                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        await userAuth.ResetPassowrd(
                            email: email.text, context: context);
                        setState(() {
                          isLoading = false;
                        });
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
