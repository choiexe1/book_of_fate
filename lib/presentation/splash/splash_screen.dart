import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/presentation/splash/splash_action.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Function(SplashAction action) onAction;

  const SplashScreen({super.key, required this.onAction});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 1500), () {
        widget.onAction(SplashAction.navigateToHome());
      });
    });

    return Scaffold(
      body: BackgroundContainer(
        backgroundImage: 'assets/images/splash.png',
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
}
