import 'package:comestore/models/SectionHomeModel.dart';
import 'package:flutter/material.dart';

class SectionHome extends StatelessWidget {
  const SectionHome({
    super.key,
    required this.model,
    this.ontap,
  });
  final SectionHomeModel model;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color(0xffD9D9D9),
                border: Border.all(color: const Color(0xffD9D9D9))),
            height: 50,
            width: 50,
            child: Container(
              margin: EdgeInsets.all(8),
              height: 30,
              width: 30,
              child: Image.asset(model.imageIcon),
            ),
          ),
          Text(
            model.name,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: "IBM Plex Sans Arabic",
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
