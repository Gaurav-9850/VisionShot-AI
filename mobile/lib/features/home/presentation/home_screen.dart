import 'package:flutter/material.dart';
import '../../../shared/widgets/home_button.dart';
import '../../camera/presentation/camera_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VisionShot AI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.camera_alt,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "AI Photography Assistant",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Capture stunning photos using AI-powered composition guidance.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            HomeButton(
  icon: Icons.camera,
  title: "Start Camera",
  onTap: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CameraScreen(),
      ),
    );

  },
),

            const SizedBox(height: 15),

            HomeButton(
              icon: Icons.photo_library,
              title: "Gallery",
              onTap: () {},
            ),

            const SizedBox(height: 15),

            HomeButton(
              icon: Icons.menu_book,
              title: "Learn Photography",
              onTap: () {},
            ),

            const SizedBox(height: 15),

            HomeButton(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {},
            ),

            const Spacer(),

            const Text("Version 1.0"),
          ],
        ),
      ),
    );
  }
}