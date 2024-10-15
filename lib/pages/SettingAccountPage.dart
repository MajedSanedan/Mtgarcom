import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class SettingAccountPage extends StatelessWidget {
  const SettingAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" مــتـجـر كـــــــــــــوم - الأعـــــدادت "),
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
                title: "أعدادت الحساب الشخصي",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "تعديل",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "البيانات الشخصية",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                width: 351,
                height: 339.21,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FieldInfo(
                        label: "الاسم الأول",
                      ),
                      FieldInfo(
                        label: "الاسم الثاني",
                      ),
                      FieldInfo(
                        label: "رقم الجوال",
                      ),
                      FieldInfo(
                        label: "البريد الالكتروني",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "بيانات الامان",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
              MaterialButton(
                onPressed: () {},
                color: const Color(0xffe8e8e8),
                child: const Text(
                  "تعديل كلمة المرور",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
