import 'package:bookmate/navigation/route.dart';
import 'package:bookmate/screens/home_page.dart';
import 'package:bookmate/screens/settings_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoute.settings.path,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
