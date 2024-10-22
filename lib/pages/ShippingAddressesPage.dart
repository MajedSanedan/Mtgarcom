import 'package:comestore/pages/AddAddressPage.dart';
import 'package:comestore/widgets/AddressWidget.dart';
import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " مــتـجـر كـــــــــــــوم - الأعـــــدادت ",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xffe8e8e8),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddAddressPage()));
              },
              icon: const Icon(Icons.add))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "عــــنـــــاويــــن الـشـــحــــن",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const AddressWidget(
                name: "محمد علي",
                address: "اليمن_عدن_دار سعد_الشارع الرائيسي",
                phone: "+967 777777777",
              ),
              const SizedBox(
                height: 30,
              ),
              const AddressWidget(
                name: "محمد علي",
                address: "اليمن_عدن_دار سعد_الشارع الرائيسي",
                phone: "+967 777777777",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
