import 'package:comestore/pages/CategoriesPage.dart';
import 'package:comestore/pages/ManagmentCategories.dart';
import 'package:comestore/pages/ProductDistinctiVeviewPage.dart';
import 'package:comestore/pages/ProductsViewPage.dart';
import 'package:comestore/widgets/BanerHome.dart';
import 'package:comestore/widgets/CategoryDistinctiveView.dart';
import 'package:comestore/widgets/ProductDistinctiveView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:comestore/widgets/SectionHomeView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/imagesBaner/Artboard1.jpg",
  "assets/images/imagesBaner/Artboard2.jpg",
  "assets/images/imagesBaner/Artboard3.jpg",
];

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(" مــتـجـر كـــــــــــــوم - الرائيسية"),
            SearchTextField(),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              BanerHome(
                images: images,
              ),
              const SizedBox(
                height: 20,
              ),
              SectionHomeView(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoriesPage()));
                    },
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "الاقسام المميزة",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: CategoryDistinctiveView(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDistinctiVeviewPage()));
                    },
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "العروض المميزة",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                  height: 150,
                  child: ProductDistinctiVeview(
                    reverse: true,
                  )),
              SizedBox(
                height: 20,
              ),
              FirebaseAuth.instance.currentUser!.email ==
                      "majedsanedan@gmail.com"
                  ? InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MnaagmentCategoriesPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff1E1E1E),
                            borderRadius: BorderRadius.circular(7)),
                        height: 49.95,
                        width: 351,
                        child: Center(
                          child: Text(
                            "إدارة المنتجات والاصناف",
                            style: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: "IBM Plex Sans Arabic",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
              // ProductCard()
            ],
          ),
        ),
      ),
    );
  }
}
