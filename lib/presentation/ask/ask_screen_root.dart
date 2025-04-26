import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/ask/ask_action.dart';
import 'package:book_of_fate/presentation/ask/ask_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AskScreenRoot extends StatelessWidget {
  const AskScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return AskScreen(
      onAction: (action) {
        switch (action) {
          case NavigateToAnswer():
            context.go(Routes.answer);
        }
      },
    );
  }
}
