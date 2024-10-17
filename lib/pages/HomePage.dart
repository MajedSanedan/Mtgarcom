import 'package:comestore/pages/AccountPage.dart';
import 'package:comestore/pages/CartPage.dart';
import 'package:comestore/pages/CategoriesPage.dart';
import 'package:comestore/pages/HomeViewPage.dart';
import 'package:comestore/pages/ProductsViewPage.dart';
import 'package:comestore/widgets/BanerHome.dart';
import 'package:comestore/widgets/CategoryDistinctiveView.dart';
import 'package:comestore/widgets/ProductDistinctiveView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:comestore/widgets/SectionHomeView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    AccountPage(),
    CartPage(),
    HomeViewPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: Colors.blue),
            backgroundColor: const Color(0xff1E1E1E),
            selectedFontSize: 0,
            items: const [
              BottomNavigationBarItem(
                  label: "حسابي",
                  icon: Icon(
                    Icons.person,
                    // color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  label: "السلة",
                  icon: Icon(
                    Icons.shopping_bag,
                    //color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  label: "الرائيسية",
                  icon: Icon(
                    Icons.home,
                    // color: Colors.white,
                  )),
            ],
            iconSize: 30,

            unselectedItemColor: Colors.white,
            currentIndex: _selectedIndex, // العنصر المحدد حاليًا
            selectedItemColor: Colors.blue, // لون العنصر المحدد
            onTap: _onItemTapped, // استدعاء الوظيفة عند النقر
          ),
        ),
      ),
    );
  }
}
