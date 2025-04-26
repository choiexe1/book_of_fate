import 'package:book_of_fate/core/routes.dart';
import 'package:book_of_fate/presentation/ask/ask_screen_root.dart';
import 'package:book_of_fate/presentation/home/home_screen_root.dart';
import 'package:book_of_fate/presentation/splash/splash_screen_root.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreenRoot(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreenRoot(),
    ),
    GoRoute(
      path: Routes.ask,
      builder: (context, state) => const AskScreenRoot(),
    ),
  ],
);
