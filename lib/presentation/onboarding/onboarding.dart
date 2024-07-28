import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/font_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
          child: Text(
        "OnBoarding Screen!",
        style:
            TextStyle(color: ColorManager.darkPrimary, fontSize: FontSize.s14),
      )),
    );
  }
}
