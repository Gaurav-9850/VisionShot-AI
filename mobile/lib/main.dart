import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';

void main() {
  runApp(const VisionShotAI());
}

class VisionShotAI extends StatelessWidget {
  const VisionShotAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisionShot AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}