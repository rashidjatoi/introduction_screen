import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:introduction_screen/page%20screen/home_page.dart';
import 'package:introduction_screen/page%20screen/page_screen1.dart';
import 'package:introduction_screen/page%20screen/page_screen2.dart';
import 'package:introduction_screen/page%20screen/page_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool onLastPage = false;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // To keep the track of page
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              onLastPage == (index == 2);
              setState(() {});
            },
            children: const [
              PageScreen1(),
              PageScreen2(),
              PageScreen3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Skip Page indicator
                  GestureDetector(
                      onTap: () {
                        _controller.jumpTo(2);
                      },
                      child: Text('Skip')),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  // Next Page indicator
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Text('Done'))
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Text('Next')),
                ],
              ))
        ],
      ),
    );
  }
}
