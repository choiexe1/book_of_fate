import 'package:book_of_fate/presentation/answer/answer_action.dart';
import 'package:book_of_fate/presentation/answer/answer_screen_state.dart';
import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';
import 'package:typethis/typethis.dart';

class AnswerScreen extends StatelessWidget {
  final AnswerScreenState state;
  final Function(AnswerAction action) onAction;

  const AnswerScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        exposure: 1,
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const Spacer(),
              Builder(
                builder: (context) {
                  if (state.isLoading) {
                    return CircularProgressIndicator(color: AppColor.gold);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.black.withValues(alpha: 0.6),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: TypeThis(
                        speed: 120,
                        string: state.answer!.text,
                        style: AppFont.semiBold.copyWith(
                          color: AppColor.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onAction(AnswerAction.navigateToHome()),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightNavy,
              ),
              child: Icon(Icons.arrow_back, color: AppColor.white),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '답변',
            style: AppFont.semiBold.copyWith(
              color: AppColor.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
