import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/AddAddressPage.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/pages/SettingAccountPage.dart';
import 'package:comestore/widgets/AccountWidget.dart';
import 'package:comestore/widgets/AddressWidget.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key, required this.uaserAddress});
  final UserAddressModel uaserAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " مــتـجـر كـــــــــــــوم - الأعـــــدادت ",
          style: TextStyle(fontSize: 20),
        ),
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
                title: "عــــنـــاويـــن الــــشـــحـــن",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AddressWidget(
                  name: uaserAddress.name!,
                  address: uaserAddress.address!,
                  phone: uaserAddress.phone!)
            ],
          ),
        ),
      ),
    );
  }
}
