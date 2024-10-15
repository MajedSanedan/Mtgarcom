import 'package:comestore/pages/SettingAccountPage.dart';
import 'package:comestore/widgets/AccountWidget.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
