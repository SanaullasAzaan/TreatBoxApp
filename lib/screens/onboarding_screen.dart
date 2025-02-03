// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:treatboxrefurbisshed/models/onboarding_content.dart';
import 'package:treatboxrefurbisshed/screens/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: contents[i].gradientColors,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
                      Opacity(
                        opacity: 0.999,
                        child: Center(
                          child: Image.asset(
                            contents[i].image,
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                              Text(
                              contents[i].title,
                              style: contents[i].titleStyle,  // titleStyle is already non-nullable in OnboardingContent
                              ),



                      const SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildDotIndicators(),
              _buildBottomButtons(),
            ],
          ),
          _buildSkipButton(),
        ],
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        contents.length,
        (index) => Container(
          height: 10,
          width: currentIndex == index ? 25 : 10,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentIndex == index 
                ? Colors.black
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WelcomeScreen(),
                  ),
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Positioned(
      top: 40,
      right: 20,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
          );
        },
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
} 