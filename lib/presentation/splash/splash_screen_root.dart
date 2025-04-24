import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/splash/splash_action.dart';
import 'package:book_of_fate/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenRoot extends StatelessWidget {
  const SplashScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      onAction: (action) {
        switch (action) {
          case NavigateToHome():
            context.go(Routes.home);
            break;
        }
      },
    );
  }
}
