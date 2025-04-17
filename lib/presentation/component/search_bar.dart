import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final Function(String) onSubmit;

  const AppSearchBar({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF4FB6B2), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onSubmitted: (value) => onSubmit(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(horizontal: 13),
          hintStyle: TextStyle(color: Color(0xFFD9D9D9), fontSize: 24),
          suffixIcon: Icon(Icons.search, color: Color(0xFF4FB6B2)),
        ),
      ),
    );
  }
}
