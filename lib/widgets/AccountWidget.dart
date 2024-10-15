import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.text,
    required this.icon,
    this.ontap,
  });
  final String text;
  final Icon icon;
  final Function? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.71,
      width: 165.64,
      child: Column(
        children: [
          icon,
          InkWell(
            onTap: () {},
            child: Container(
              width: 165.64,
              height: 55.54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xffD9D9D9)),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      fontSize: 14,
                      color: Color(0xff1E1E1E),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
