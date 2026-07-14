import 'dart:io';

import 'package:image/image.dart' as img;

import 'image_analyzer.dart';

class SharpnessAnalyzer implements ImageAnalyzer<double> {
  @override
  Future<double> analyze(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();

    final image = img.decodeImage(bytes);

    if (image == null) {
      return 0;
    }

    double sharpness = 0;

    for (int y = 1; y < image.height; y++) {
      for (int x = 1; x < image.width; x++) {
        final current = image.getPixel(x, y);
        final previous = image.getPixel(x - 1, y);

        sharpness +=
            (current.r - previous.r).abs() +
            (current.g - previous.g).abs() +
            (current.b - previous.b).abs();
      }
    }

    return sharpness /
        (image.width * image.height * 3);
  }
}