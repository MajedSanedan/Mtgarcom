import 'package:flutter/material.dart';

class FieldInfo extends StatelessWidget {
  const FieldInfo({super.key, required this.label, this.textedcontroller});
  final String label;
  final TextEditingController? textedcontroller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Color(0xff1E1E1E),
              fontFamily: "IBM Plex Sans Arabic",
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30.87,
          width: 281.61,
          child: TextField(
            controller: textedcontroller,
            decoration: InputDecoration(
                fillColor: Color(0xffe8e8e8),
                filled: true,
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
