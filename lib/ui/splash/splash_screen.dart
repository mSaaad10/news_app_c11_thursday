import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
