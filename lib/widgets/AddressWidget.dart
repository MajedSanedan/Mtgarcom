import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
  });
  final String name;
  final String address;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351,
      height: 144.63,
      decoration: BoxDecoration(
          color: const Color(0xffe8e8e8),
          borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Text(
                  "تعديل",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              address,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: "IBM Plex Sans Arabic",
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              phone,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: "IBM Plex Sans Arabic",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
