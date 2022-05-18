import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../../layout/news_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: NewsLayout(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/icon.jpg",
      text: "News App",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.redAccent,
        Colors.white,
        Colors.red,
      ],
      backgroundColor: Colors.white,


    );
  }
}
