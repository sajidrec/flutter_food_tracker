import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const FoodTracker());
}

class FoodTracker extends StatelessWidget {
  const FoodTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
