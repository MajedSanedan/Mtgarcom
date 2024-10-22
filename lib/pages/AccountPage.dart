import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/AddAddressPage.dart';
import 'package:comestore/pages/AddressPage.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/pages/SettingAccountPage.dart';
import 'package:comestore/widgets/AccountWidget.dart';
import 'package:comestore/widgets/CusttomButton.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserAddressModel userAddressModel = UserAddressModel();
  FirestoreGet firestoreGet = FirestoreGet();

  bool isLoading = true;

  String emailuser = FirebaseAuth.instance.currentUser!.email!;
  //

  Future<void> getData() async {
    userAddressModel = await firestoreGet.getUserAddress(emailuser);

    if (mounted) {
      // تحقق مما إذا كان الـ widget لا يزال موجودًا
      setState(() {
        isLoading = false;
      });
    }

    print(userAddressModel.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " مــتـجـر كـــــــــــــوم - الأعـــــدادت ",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: isLoading
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MainTitle(
                      title: "الحساب الشخصي",
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddressPage(
                                      uaserAddress: userAddressModel,
                                    )));
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
                                builder: (context) => SettingAccountPage(
                                      userAddress: userAddressModel,
                                    )));
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
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        })
                  ],
                ),
              ),
            ),
    );
  }
}
