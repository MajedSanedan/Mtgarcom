import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CusttomDialog extends StatelessWidget {
  const CusttomDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.Message,
    this.color,
  });
  final IconData icon;
  final String title;
  final String Message;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 60,
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            title,
            style: TextStyle(
                color: color,
                fontFamily: "IBM Plex Sans Arabic",
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ],
      ),
      content: Text(
        textAlign: TextAlign.end,
        Message,
        style: TextStyle(
            color: Color(0xff1E1E1E),
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      actions: <Widget>[
        TextButton(
          child: Center(
              child: Text(
            "مـــوفــق",
            style: TextStyle(
                color: Color(0xff1E1E1E),
                fontFamily: "IBM Plex Sans Arabic",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          )),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
