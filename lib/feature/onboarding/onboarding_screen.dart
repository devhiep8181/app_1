import 'package:app_1/feature/route/route_constant.dart';
import 'package:flutter/material.dart';

import 'content_modal.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(todoScreen);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff78746D)),
              ))
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 115),
        Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: content.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Image.asset(content[i].image),
                      const SizedBox(height: 16),
                      Text(
                        content[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3C3A36)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        content[i].discription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff78746D)),
                      ),
                    ],
                  );
                })),
        Padding(
          padding: const EdgeInsets.only(bottom: 72),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                content.length, (index) => buildDot(index, context)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE3562A),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                if (currentIndex == content.length - 1) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginScreen, (route) => false);
                }
                _controller?.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentIndex == content.length - 1
                        ? "Let's Start"
                        : "Next"),
                  ],
                ),
              )),
        ),
        const SizedBox(height: 50),
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 6,
        width: currentIndex == index ? 18 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: currentIndex == index
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff65AAEA))
            : BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 129, 98, 96)));
  }
}
