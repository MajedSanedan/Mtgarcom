import 'dart:async';

import 'package:comestore/firebase/FireStoreGet.dart';
import 'package:comestore/models/ProductModel.dart';
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
  const HomePage({super.key, this.index = 2});
  final int index;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = [];

  FirestoreGet firestoreGet = FirestoreGet();
  Future<void> getData() async {
    products = await firestoreGet.getItemsFromCart();
    if (mounted) {
      setState(() {});
    }
  }

  late int _selectedIndex;
  Timer? _timer;
  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // void _startAutoRefresh() {
  //   _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
  //     setState(() {
  //       getData(); // Refresh data (e.g., fetch new data from API)
  //     });
  //   });
  // }
  void _startAutoRefresh() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (mounted) {
        // تحقق مما إذا كان الويدجت لا يزال موجودًا
        setState(() {
          getData(); // تحديث البيانات
        });
      }
    });
  }

  static const List<Widget> _pages = <Widget>[
    AccountPage(),
    CartPage(),
    HomeViewPage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.index;
    getData();
    _startAutoRefresh();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

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
            items: [
              BottomNavigationBarItem(
                  label: "حسابي",
                  icon: Icon(
                    Icons.person,
                    // color: Colors.white,
                  )),
              BottomNavigationBarItem(
                label: "السلة",
                icon: Stack(children: [
                  Icon(
                    Icons.shopping_bag,
                    //color: Colors.white,
                  ),
                  products.length != 0
                      ? Positioned(
                          right: 10,
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Text(
                                products.length.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      : SizedBox()
                ]),
              ),
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
