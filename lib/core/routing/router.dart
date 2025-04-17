import 'package:go_router/go_router.dart';
import 'package:modu_image_search_app/core/routes.dart';
import 'package:modu_image_search_app/presentation/home/home_screen.dart';
import 'package:modu_image_search_app/presentation/image/image_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: Routes.image,
      builder:
          (context, state) =>
              ImageScreen(query: state.pathParameters['query']!),
    ),
  ],
);
