import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title, this.ontap});
  final String title;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(7)),
      height: 49.95,
      width: 351,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 35,
            ),
            onPressed: ontap,
          ),
          const SizedBox(
            width: 70,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontFamily: "IBM Plex Sans Arabic",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
