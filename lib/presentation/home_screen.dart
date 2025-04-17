import 'package:flutter/material.dart';
import 'package:modu_image_search_app/presentation/component/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(16.0), child: AppSearchBar()),
      ),
    );
  }
}
