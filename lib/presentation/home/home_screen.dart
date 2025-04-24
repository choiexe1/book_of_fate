import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/presentation/components/gradient_button.dart';
import 'package:book_of_fate/presentation/home/home_action.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(HomeAction action) onAction;

  const HomeScreen({super.key, required this.onAction});

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
              SizedBox(
                width: 200,
                child: Column(
                  spacing: 16,
                  children: [
                    GradientButton(
                      onTap: () {
                        onAction(HomeAction.navigateToAsk());
                      },
                      text: '질문하기',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
