import 'package:app_uas_19710085/Home_view.dart';
import 'package:app_uas_19710085/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    home: SplashScreenView(
      navigateRoute: HomePage(),
      duration: 10000,
      imageSize: 200,
      imageSrc: "img/exodus.gif",
      text: "EXODUS NEWS",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.redAccent,
        Colors.yellow,
        Colors.tealAccent,
      ],
      backgroundColor: Colors.black.withBlue(20),
    ),
  ));
}