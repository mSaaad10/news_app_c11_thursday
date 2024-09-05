import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/core/theme/app_theme.dart';
import 'package:news_app_c11_thursday/ui/home/home_screen.dart';
import 'package:news_app_c11_thursday/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appLightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
