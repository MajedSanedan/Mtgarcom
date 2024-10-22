import 'package:comestore/widgets/MainTitle.dart';
import 'package:comestore/widgets/ProductView.dart';
import 'package:comestore/widgets/SearchTextField.dart';
import 'package:comestore/widgets/SearchviewProduct.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, this.wordSearch});
  final String? wordSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "مــــــتــــــجــــــــــــــر  كـــــــــــــــوم",
        style: TextStyle(fontSize: 20),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "نتـــائــج البـــحث",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: SearchViewProduct(
                wordSearch: wordSearch,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
