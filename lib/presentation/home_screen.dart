import 'package:flutter/material.dart';
import 'package:modu_image_search_app/presentation/component/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 33),
          child: Column(
            spacing: 24,
            children: [
              AppSearchBar(
                controller: controller,
                onSubmit: (value) => debugPrint(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
