import 'dart:io';

import 'package:image/image.dart' as img;

import 'image_analyzer.dart';

class BrightnessAnalyzer implements ImageAnalyzer<double> {
  @override
  Future<double> analyze(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();

    final image = img.decodeImage(bytes);

    if (image == null) {
      return 0;
    }

    double totalBrightness = 0;

    for (final pixel in image) {
      totalBrightness +=
          (pixel.r + pixel.g + pixel.b) / 3;
    }

    final averageBrightness =
        totalBrightness / image.length;

    return (averageBrightness / 255) * 100;
  }
}