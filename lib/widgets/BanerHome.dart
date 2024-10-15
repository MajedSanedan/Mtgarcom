import 'dart:async';

import 'package:flutter/material.dart';

class BanerHome extends StatefulWidget {
  const BanerHome({super.key, required this.images});
  final List<String> images;
  @override
  State<BanerHome> createState() => _BanerHomeState();
}

class _BanerHomeState extends State<BanerHome> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (_currentPage < widget.images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 130,
          width: 338,
          child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.images[index]))),
                );
              }),
        ),
        Positioned(
          bottom: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? const Color(0xff1E1E1E)
                      : const Color(0xffD9D9D9),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
