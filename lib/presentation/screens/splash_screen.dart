import 'package:book_of_fate/presentation/components/start_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      // 1. 데이터베이스 연결 확인
      // await _checkDatabaseConnection();
      // TODO: delayed 제거하고 데이터베이스 초기화 및 기본 세팅
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        _animationController.forward();
      }
    } catch (e) {
      // TODO: 오류 처리
      // debugPrint("초기화 오류: $e");
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _animationController.forward();
      }
    }
  }

  Future<bool> _checkDatabaseConnection() async {
    // final database = await openDatabase('book_of_fate.db');
    return true; // 시뮬레이션을 위해 항상 성공으로 가정
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
            colorFilter: exposure(1.9),
          ),
        ),
        child: Column(
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
                        child: Center(
                          child: StartButton(
                            text: '시작하기',
                            onPressed: () {
                              debugPrint('Button pressed');
                            },
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
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
