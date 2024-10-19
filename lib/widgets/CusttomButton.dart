import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.backgroundcolor = const Color(0xff1E1E1E),
      this.textcolor = const Color(0xffFFFFFF)});
  final String text;
  final Function() ontap;
  final Color? backgroundcolor;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 38.31,
      minWidth: double.infinity,
      color: backgroundcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(
            color: textcolor,
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}
