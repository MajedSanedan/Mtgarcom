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
import 'package:comestore/pages/testPage.dart';
import 'package:comestore/pages/testPage2.dart';
import 'package:firebase_core/firebase_core.dart';
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
  int _selectedIndex = 2;
  static const List<Widget> _pages = <Widget>[
    AccountPage(),
    CartPage(),
    HomePage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        body: LoginPage(),
        // _pages.elementAt(_selectedIndex),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(12),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(12),
        //     child: BottomNavigationBar(
        //       selectedIconTheme: IconThemeData(color: Colors.blue),
        //       backgroundColor: const Color(0xff1E1E1E),
        //       selectedFontSize: 0,
        //       items: const [
        //         BottomNavigationBarItem(
        //             label: "حسابي",
        //             icon: Icon(
        //               Icons.person,
        //               // color: Colors.white,
        //             )),
        //         BottomNavigationBarItem(
        //             label: "السلة",
        //             icon: Icon(
        //               Icons.shopping_bag,
        //               //color: Colors.white,
        //             )),
        //         BottomNavigationBarItem(
        //             label: "الرائيسية",
        //             icon: Icon(
        //               Icons.home,
        //               // color: Colors.white,
        //             )),
        //       ],
        //       iconSize: 30,

        //       unselectedItemColor: Colors.white,
        //       currentIndex: _selectedIndex, // العنصر المحدد حاليًا
        //       selectedItemColor: Colors.blue, // لون العنصر المحدد
        //       onTap: _onItemTapped, // استدعاء الوظيفة عند النقر
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
