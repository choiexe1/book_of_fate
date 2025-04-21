import 'package:book_of_fate/presentation/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> with TickerProviderStateMixin {
  int _step = 0;

  late final AnimationController _textFadeController;
  late final AnimationController _buttonFadeController;

  final List<String> _stepsText = [
    '눈을 감고 천천히 질문을 떠올려보세요.',
    '구체적인 질문을 하면\n 더 정확한 답변을 얻을 수 있어요.',
    '이제, 답변을 확인해보세요.',
  ];

  @override
  void initState() {
    super.initState();

    _textFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _buttonFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _startSteps();
  }

  Future<void> _startSteps() async {
    for (int i = 0; i < _stepsText.length; i++) {
      setState(() {
        _step = i;
      });

      _textFadeController.forward(from: 0.0);
      await Future.delayed(const Duration(seconds: 5));
    }

    _buttonFadeController.forward();
  }

  @override
  void dispose() {
    _textFadeController.dispose();
    _buttonFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        exposure: 1,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
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
                      '질문하기',
                      style: AppFont.semiBold.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FadeTransition(
                opacity: _textFadeController,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.black.withValues(alpha: 0.6),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _stepsText[_step],
                    textAlign: TextAlign.center,
                    style: AppFont.semiBold.copyWith(
                      color: AppColor.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                child:
                    _step == _stepsText.length - 1
                        ? FadeTransition(
                          opacity: _buttonFadeController,
                          child: SizedBox(
                            width: 200,
                            child: GradientButton(
                              text: '답변보기',
                              onTap: () {
                                _buttonFadeController.forward();
                                _textFadeController.reverse();
                                _step++;
                              },
                            ),
                          ),
                        )
                        : const SizedBox(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
