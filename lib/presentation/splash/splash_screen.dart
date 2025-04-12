import 'package:book_of_fate/presentation/components/start_button.dart';
import 'package:book_of_fate/presentation/components/custom_scaffold.dart';
import 'package:book_of_fate/ui/ui_color.dart';
import 'package:book_of_fate/ui/ui_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback? onPressed;

  const SplashScreen({super.key, this.onPressed});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _slideAnimation = Tween<double>(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _startInitializationProcess();
  }

  Future<void> _startInitializationProcess() async {
    try {
      // await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        _animationController.forward();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImage: 'assets/images/splash.png',
      colorFilter: exposure(1.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _isInitialized
              ? AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        children: [
                          Text(
                            'Book of Fate',
                            style: UIText.titleTextBold.copyWith(
                              color: UIColor.softGold,
                              shadows: [
                                Shadow(
                                  color: UIColor.black.withAlpha(100),
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.50,
                          ),
                          Center(
                            child: StartButton(
                              text: '시작하기',
                              onPressed: () {
                                widget.onPressed?.call();
                              },
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              : const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
          const SizedBox(height: 180),
        ],
      ),
    );
  }

  ColorFilter exposure(double exposure) {
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
