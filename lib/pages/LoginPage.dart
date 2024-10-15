import 'package:comestore/pages/PasswordVerificationPage.dart';
import 'package:comestore/pages/RegisterPage.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                height: 180.94,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FieldInfo(
                        label: "رقم الجوال او البريد الإلكتروني",
                      ),
                      FieldInfo(
                        label: "كلمة المرور",
                      ),
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
              CustomButton(
                text: "التسجيل بواسطة حساب جوجل",
                ontap: () {},
              ),
              const SizedBox(
                height: 6,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
