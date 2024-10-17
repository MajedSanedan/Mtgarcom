import 'package:comestore/pages/CategoriesPage.dart';
import 'package:comestore/pages/ProductsViewPage.dart';
import 'package:comestore/widgets/BanerHome.dart';
import 'package:comestore/widgets/CategoryDistinctiveView.dart';
import 'package:comestore/widgets/ProductDistinctiveView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:comestore/widgets/SectionHomeView.dart';
import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/imagesBaner/ezero.png",
  "assets/images/imagesBaner/fireBasewithFlutter.jpg",
  "assets/images/imagesBaner/Fluttertraining.JPG",
  "assets/images/imagesBaner/flutter.png",
  "assets/images/imagesBaner/git.webp",
  "assets/images/imagesBaner/html.png",
];

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
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
              const SizedBox(
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
                          builder: (context) => ProductsViewPage()));
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
              SizedBox(height: 150, child: ProductDistinctiVeview())
              // ProductCard()
            ],
          ),
        ),
      ),
    );
  }
}
