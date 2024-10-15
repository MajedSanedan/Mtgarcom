import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

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
                title: "إضـــــافة عـــــنـــــوان",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 351,
                height: 230,
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
                        label: "الاسم ",
                      ),
                      FieldInfo(
                        label: "العنوان",
                      ),
                      FieldInfo(
                        label: "رقم الجوال",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(width: 0, color: Color(0xffe8e8e8))),
                onPressed: () {},
                color: const Color(0xffe8e8e8),
                child: const Text(
                  "إضـــافــــة او تــــعــــديــــل",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
