import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.hintext = "الــــبــحــث"});
  final String? hintext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: hintext,
            hintStyle: const TextStyle(
                fontFamily: "IBM Plex Sans Arabic",
                fontSize: 14,
                color: Color(0xffD9D9D9)),
            suffixIcon: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    "assets/images/imageIcons/search.png",
                  )),
                  color: const Color(0xff1E1E1E),
                  borderRadius: BorderRadius.circular(3)),
              height: 36,
              width: 32,
              // child: Center(
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
      ),
    );
  }
}
