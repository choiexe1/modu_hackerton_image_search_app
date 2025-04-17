import 'package:flutter/material.dart';
import 'package:modu_image_search_app/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Image Search App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
