import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/home/home_action.dart';
import 'package:book_of_fate/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenRoot extends StatelessWidget {
  const HomeScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      onAction: (action) {
        switch (action) {
          case NavigateToAsk():
            context.push(Routes.ask);
        }
      },
    );
  }
}
