import 'dart:io';

import 'package:image/image.dart' as img;

import 'image_analyzer.dart';

class ContrastAnalyzer implements ImageAnalyzer<double> {
  @override
  Future<double> analyze(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();

    final image = img.decodeImage(bytes);

    if (image == null) {
      return 0;
    }

    double sum = 0;

    for (final pixel in image) {
      sum +=
          (pixel.r + pixel.g + pixel.b) / 3;
    }

    final mean = sum / image.length;

    double variance = 0;

    for (final pixel in image) {
      final value =
          (pixel.r + pixel.g + pixel.b) / 3;

      variance +=
          (value - mean) *
          (value - mean);
    }

    variance /= image.length;

    return (variance / 255) * 100;
  }
}