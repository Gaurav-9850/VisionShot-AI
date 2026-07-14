import 'package:flutter/material.dart';

class CameraControls extends StatelessWidget {
  final VoidCallback onCapture;
  final VoidCallback onSwitchCamera;
  final bool canCapture;

  const CameraControls({
    super.key,
    required this.onCapture,
    required this.onSwitchCamera,
    required this.canCapture,
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
            onTap: canCapture ? onCapture : null,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: canCapture ? 1.0 : 0.4,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: canCapture ? Colors.white : Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade700,
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: canCapture ? Colors.black : Colors.white,
                    size: 32,
                  ),
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