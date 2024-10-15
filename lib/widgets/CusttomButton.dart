import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 38.31,
      minWidth: double.infinity,
      color: Color(0xff1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}
