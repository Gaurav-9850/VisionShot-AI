import '../models/blur_level.dart';

BlurLevel getBlurLevel(double blur) {
  if (blur < 25) {
    return BlurLevel.low;
  }

  if (blur < 50) {
    return BlurLevel.medium;
  }

  return BlurLevel.high;
}