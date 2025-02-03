import 'package:flutter/material.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final List<Color> gradientColors;
  final TextStyle? titleStyle;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.gradientColors,
    TextStyle? titleStyle,
  }) : titleStyle = titleStyle ?? _defaultTitleStyle;

  static const TextStyle _defaultTitleStyle = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w800,
    fontFamily: 'Exo2',
  );
}

final List<OnboardingContent> contents = [
  OnboardingContent(
    image: "assets/images/onb1.png",
    title: "Cookies",
    description: "Freshly baked cookies \n at your fingertips.",
    gradientColors: const [
      Color.fromRGBO(200, 154, 105, 1),
      Color.fromRGBO(210, 167, 110, 1),
    ],
    titleStyle: const TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w800,
      fontFamily: 'Exo2',
      letterSpacing: 1.2,
    ),
  ),
  OnboardingContent(
    image: "assets/images/onb2.png",
    title: "Chocolates",
    description: "Indulge in premium chocolates.",
    gradientColors: [
      const Color.fromRGBO(122, 71, 43, 1),
      const Color.fromRGBO(122, 71, 43, 1),
    ],
  ),
  OnboardingContent(
    image: "assets/images/onb3.png",
    title: "Dry Fruits & Nuts ",
    description: "Healthy, nutritious dry \n fruits delivered to you.",
    gradientColors: [
      const Color.fromRGBO(150, 104, 81, 1),
      const Color.fromRGBO(140, 132, 105, 1),
    ],
  ),
]; 