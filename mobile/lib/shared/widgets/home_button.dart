import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const HomeButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}