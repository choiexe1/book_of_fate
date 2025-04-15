import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/register/register_screen.dart';
import 'package:book_of_fate/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
