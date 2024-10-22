import 'package:comestore/pages/AccountPage.dart';
import 'package:comestore/pages/AddAddressPage.dart';
import 'package:comestore/pages/BestSellerPage.dart';
import 'package:comestore/pages/BrandsPage.dart';
import 'package:comestore/pages/CartPage.dart';
import 'package:comestore/pages/CategoriesPage.dart';
import 'package:comestore/pages/HomePage.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/pages/OffersPage.dart';
import 'package:comestore/pages/ProductPage.dart';
import 'package:comestore/pages/ProductsViewPage.dart';
import 'package:comestore/pages/RegisterPage.dart';
import 'package:comestore/pages/SettingAccountPage.dart';
import 'package:comestore/pages/ShippingAddressesPage.dart';
import 'package:comestore/widgets/Loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Offers
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ComeStore());
}

class ComeStore extends StatefulWidget {
  const ComeStore({super.key});

  @override
  State<ComeStore> createState() => _ComeStoreState();
}

class _ComeStoreState extends State<ComeStore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff1E1E1E),
              titleTextStyle: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: "IBM Plex Sans Arabic",
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              centerTitle: true)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? HomePage()
            : LoginPage(),
      ),
    );
  }
}
