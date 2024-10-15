import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "متـــــــــــــــجـــــــــــــر  كــــــــــــــــوم ",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FieldInfo(
                        label: "الاسم",
                        textedcontroller: name,
                      ),
                      FieldInfo(
                        label: "البريد الإلكتروني",
                        textedcontroller: email,
                      ),
                      FieldInfo(
                        label: "كلمة المرور",
                        textedcontroller: password,
                      ),
                      FieldInfo(
                        label: "تاكيد كلمة المرور",
                        textedcontroller: password,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              CustomButton(
                text: "تسجيل الدخول",
                ontap: () {},
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
