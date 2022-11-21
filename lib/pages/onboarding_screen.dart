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
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage('/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage('/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: ButtonWidget(
                text: 'Start Reading',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Read',
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
      Center(child: Image.asset(path, width: 350));

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
