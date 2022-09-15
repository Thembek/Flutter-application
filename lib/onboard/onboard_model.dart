import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'assets/images/img-1.png',
    text: "Belajar Dengan Metode Learning by Doing",
    desc: "We here, assist students in learning by having real-world praticals, Learning by Doing.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'assets/images/img-2.png',
    text: "With One Of The Most Leading Lectures In Their Field",
    desc: "Lectures will not only guide you in your daily praticals, but will also get an opportunity to work on real world projects.",
    bg: Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: 'assets/images/img-3.png',
    text: "Work In Teams On A Project Of Your Liking",
    desc: "As students, you will also have an opportunity to work in a team of your own.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];

