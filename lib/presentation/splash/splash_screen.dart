import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        // ignore: use_build_context_synchronously
        context.go(Routes.home);
      });
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash.png'),
            colorFilter: buildColorFilter(1.7),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 150),
            Text(
              'Book of Fate',
              style: AppFont.bold.copyWith(fontSize: 48, color: AppColor.white),
            ),
            Text(
              'Discover your destiny',
              style: AppFont.bold.copyWith(
                fontSize: 18,
                color: AppColor.softGold,
              ),
            ),
            const SizedBox(height: 400),
            const CircularProgressIndicator(color: AppColor.softGold),
          ],
        ),
      ),
    );
  }

  ColorFilter buildColorFilter(double exposure) {
    return ColorFilter.matrix([
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }
}
