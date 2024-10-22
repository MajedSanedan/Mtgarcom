import 'package:comestore/firebase/EditUserProfile.dart';
import 'package:comestore/models/UserModel.dart';
import 'package:comestore/pages/PasswordVerificationPage.dart';
import 'package:comestore/widgets/FieldInfo.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class SettingAccountPage extends StatefulWidget {
  const SettingAccountPage({super.key, required this.userAddress});
  final UserAddressModel userAddress;
  @override
  State<SettingAccountPage> createState() => _SettingAccountPageState();
}

class _SettingAccountPageState extends State<SettingAccountPage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  Edituserprofile edituserprofile = Edituserprofile();
  UserAddressModel userUpdat = UserAddressModel();

  bool enalbfield = false;
  String edite = "تعديل";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.userAddress.name == null
        ? name.text = "non"
        : name.text = widget.userAddress.name!;
    widget.userAddress.phone == null
        ? phone.text = "non"
        : phone.text = widget.userAddress.phone!;
    widget.userAddress.address == null
        ? address.text = "non"
        : address.text = widget.userAddress.address!;
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            //   crossAxisAlignment: CrossAxisAlignment.end,
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
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (enalbfield == false) {
                        enalbfield = true;
                        edite = "حفظ";
                        setState(() {});
                      } else {
                        setState(() {});
                        userUpdat = UserAddressModel(
                            name: name.text,
                            phone: phone.text,
                            address: address.text);

                        await edituserprofile.UpdatUserAddress(
                            context, userUpdat, widget.userAddress.email!);
                        enalbfield = false;
                        edite = "تعديل";
                        setState(() {});
                      }
                    },
                    child: Text(
                      edite,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.bold),
                    ),
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
                height: 300.21,
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
                        label: "الاسم الأول",
                        textedcontroller: name,
                        enable: enalbfield,
                      ),
                      FieldInfo(
                        label: "الجوال",
                        textedcontroller: phone,
                        enable: enalbfield,
                      ),
                      FieldInfo(
                        label: "العنوان",
                        textedcontroller: address,
                        enable: enalbfield,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: const Text(
                  "بيانات الامان",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w600),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PasswordVerificationPage()));
                },
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
