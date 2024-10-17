import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/pages/SettingAccountPage.dart';
import 'package:comestore/widgets/AccountWidget.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "الحساب الشخصي",
                ontap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingAccountPage()));
                    },
                    child: AccountWidget(
                      text: "عناوين الشحن",
                      icon: Icon(
                        Icons.pin_drop,
                        size: 60,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingAccountPage()));
                    },
                    child: AccountWidget(
                      text: "أعدادت الحساب الشخصي",
                      icon: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "تسجيل الخروج",
                  ontap: () async {
                    await FirebaseAuth.instance.signOut();
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    googleSignIn.disconnect();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
