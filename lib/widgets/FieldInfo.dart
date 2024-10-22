import 'package:flutter/material.dart';

class FieldInfo extends StatelessWidget {
  const FieldInfo(
      {super.key,
      required this.label,
      this.textedcontroller,
      this.validator,
      this.maxline = 1,
      this.hieght = 45.87,
      this.enable});
  final String label;
  final TextEditingController? textedcontroller;
  final String? Function(String?)? validator;
  final int? maxline;
  final double? hieght;
  final bool? enable;
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
          height: hieght,
          width: 281.61,
          child: TextFormField(
            enabled: enable,
            maxLines: maxline,
            style: TextStyle(fontSize: 16),
            validator: validator,
            controller: textedcontroller,
            decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 10),
                fillColor: Color(0xffe8e8e8),
                filled: true,
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
