import 'package:flutter/material.dart';

class CartInfo extends StatelessWidget {
  const CartInfo(
      {super.key, this.ontap, required this.totalPrice, required this.count});
  final GestureTapCallback? ontap;
  final double totalPrice;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 50,
            width: 121.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xff1E1E1E)),
            child: const Center(
              child: Text(
                "الاكمال الى التوصيل",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 121.63,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffFFFFFF)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$totalPrice\$",
                  style: const TextStyle(
                      color: Color(0xff1E1E1E),
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Text(
                  " :المجموع",
                  style: TextStyle(
                      color: Color(0xff1E1E1E),
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 87.71,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffFFFFFF)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$count",
                  style: const TextStyle(
                      color: Color(0xff1E1E1E),
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Text(
                  " :العدد",
                  style: TextStyle(
                      color: Color(0xff1E1E1E),
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
