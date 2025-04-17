import 'package:go_router/go_router.dart';
import 'package:modu_image_search_app/core/routes.dart';
import 'package:modu_image_search_app/presentation/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
  ],
);
