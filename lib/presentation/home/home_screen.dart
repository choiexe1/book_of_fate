import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/presentation/components/start_button.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        exposure: 1.1,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Book of Fate',
                style: AppFont.bold.copyWith(
                  color: AppColor.white,
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 48),
              Column(
                spacing: 16,
                children: [
                  StartButton(onPressed: () {}, text: '질문하기'),
                  StartButton(onPressed: () {}, text: '통계'),
                  StartButton(onPressed: () {}, text: '질문하기'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
