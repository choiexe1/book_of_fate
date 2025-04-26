import 'package:book_of_fate/presentation/components/background_container.dart';
import 'package:book_of_fate/presentation/components/gradient_button.dart';
import 'package:book_of_fate/ui/app_color.dart';
import 'package:book_of_fate/ui/app_font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});
  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  int guideStep = 0;
  bool _showButton = false;

  final List<String> guides = [
    '구체적인 질문을 하면\n 더 정확한 답변을 얻을 수 있어요.',
    '질문을 천천히 떠올려보세요.',
    '충분히 준비가 됐다면, 답변을 확인해보세요.',
  ];

  @override
  void initState() {
    super.initState();
  }

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
              TweenAnimationBuilder<double>(
                key: ValueKey('$guideStep'),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 5),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  double opacity;
                  if (value < 0.3) {
                    opacity = (value / 0.3).clamp(0.0, 1.0);
                  } else if (value < 0.7) {
                    opacity = 1.0;
                  } else {
                    if (guideStep == guides.length - 1) {
                      opacity = 1.0;
                    } else {
                      opacity = (1.0 - ((value - 0.7) / 0.3)).clamp(0.0, 1.0);
                    }
                  }

                  return Opacity(
                    opacity: opacity,
                    child: _buildGuideText(guides[guideStep]),
                  );
                },
                onEnd: () {
                  setState(() {
                    if (guideStep < guides.length - 1) {
                      guideStep++;
                    } else {
                      _showButton = true;
                    }
                  });
                },
              ),
              const SizedBox(height: 40),
              AnimatedOpacity(
                opacity: _showButton ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: GradientButton(text: '답변보기', onTap: () {}),
                ),
              ),
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
    );
  }

  Widget _buildGuideText(String text) {
    return Container(
      decoration: BoxDecoration(color: AppColor.black.withValues(alpha: 0.6)),
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppFont.semiBold.copyWith(color: AppColor.white, fontSize: 18),
      ),
    );
  }
}
