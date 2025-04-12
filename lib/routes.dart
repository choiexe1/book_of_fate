import 'package:book_of_fate/presentation/register/register_screen.dart';
import 'package:book_of_fate/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/':
      (context) => SplashScreen(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/register');
        },
      ),
  '/register': (context) => const RegisterScreen(),
};
