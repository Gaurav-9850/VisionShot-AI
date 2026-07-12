import 'dart:io';

import 'package:image/image.dart' as img;

class BrightnessAnalyzer {

  Future<double> analyze(String path) async {

    final bytes = await File(path).readAsBytes();

    final image = img.decodeImage(bytes);

    if (image == null) return 0;

    double total = 0;

    for (final pixel in image) {

      total +=

      (pixel.r + pixel.g + pixel.b) / 3;

    }

    return

      total /

      image.length /

      255 *

      100;

  }

}