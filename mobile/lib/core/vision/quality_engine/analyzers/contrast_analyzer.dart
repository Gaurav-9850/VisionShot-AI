import 'dart:io';
import 'package:image/image.dart' as img;

class ContrastAnalyzer {
  Future<double> analyze(String path) async {
    final bytes = await File(path).readAsBytes();
    final image = img.decodeImage(bytes);

    if (image == null) return 0;

    double brightnessSum = 0;

    for (final pixel in image) {
      brightnessSum += (pixel.r + pixel.g + pixel.b) / 3;
    }

    final mean = brightnessSum / image.length;

    double variance = 0;

    for (final pixel in image) {
      final value = (pixel.r + pixel.g + pixel.b) / 3;
      variance += (value - mean) * (value - mean);
    }

    variance /= image.length;

    return (variance / 255) * 100;
  }
}