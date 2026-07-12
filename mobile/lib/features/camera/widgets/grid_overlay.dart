import 'package:flutter/material.dart';

class GridOverlay extends StatelessWidget {
  const GridOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: GridPainter(),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 1;

    final w = size.width;
    final h = size.height;

    canvas.drawLine(
      Offset(w / 3, 0),
      Offset(w / 3, h),
      paint,
    );

    canvas.drawLine(
      Offset(2 * w / 3, 0),
      Offset(2 * w / 3, h),
      paint,
    );

    canvas.drawLine(
      Offset(0, h / 3),
      Offset(w, h / 3),
      paint,
    );

    canvas.drawLine(
      Offset(0, 2 * h / 3),
      Offset(w, 2 * h / 3),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}