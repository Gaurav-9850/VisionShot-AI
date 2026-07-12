import 'package:flutter/material.dart';

class CameraControls extends StatelessWidget {
  final VoidCallback onCapture;
  final VoidCallback onSwitchCamera;

  const CameraControls({
    super.key,
    required this.onCapture,
    required this.onSwitchCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          IconButton(
            icon: const Icon(
              Icons.flash_auto,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {},
          ),

          GestureDetector(
            onTap: onCapture,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 4,
                ),
              ),
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.flip_camera_android,
              color: Colors.white,
              size: 32,
            ),
            onPressed: onSwitchCamera,
          ),

        ],
      ),
    );
  }
}