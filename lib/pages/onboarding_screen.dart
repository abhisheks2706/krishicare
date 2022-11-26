import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../features/nav_pages/home.dart';
import '/widgets/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Rent and Earn',
              body:
                  'Rent your assets to earn or use available rental services.',
              image: buildImage('/rental.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Join our Community',
              body:
                  'Join our community of farmers and connect with farmers near you',
              image: buildImage('/community.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Krishi Store',
              body: 'Explore the Krishi items available on online store ',
              image: buildImage('/e_commerce.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Get weather updates',
              body: 'Get weather updates for your farm ',
              footer: ButtonWidget(
                text: 'Explore',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('/weather.jpg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Be KrishiCarers',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(color: Colors.black),
          ),
          onSkip: () => goToHome(context),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.green,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => debugPrint('Page $index selected'),
          globalBackgroundColor: Colors.green.shade700,
          dotsFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Myhome()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350, height: 250));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 20),
        bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
