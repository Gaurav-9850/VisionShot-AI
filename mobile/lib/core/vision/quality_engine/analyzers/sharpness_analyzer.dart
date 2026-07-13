import 'dart:io';
import 'package:image/image.dart' as img;

class SharpnessAnalyzer {
  Future<double> analyze(String path) async {
    final bytes = await File(path).readAsBytes();
    final image = img.decodeImage(bytes);

    if (image == null) return 0;

    double sharpness = 0;

    for (int y = 1; y < image.height; y++) {
      for (int x = 1; x < image.width; x++) {
        final a = image.getPixel(x, y);
        final b = image.getPixel(x - 1, y);

        sharpness +=
            (a.r - b.r).abs() +
            (a.g - b.g).abs() +
            (a.b - b.b).abs();
      }
    }

    return sharpness /
        (image.width * image.height * 3);
  }
}