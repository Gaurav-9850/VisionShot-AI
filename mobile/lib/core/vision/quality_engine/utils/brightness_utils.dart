import '../models/brightness_level.dart';

BrightnessLevel getBrightnessLevel(double value) {
  if (value < 30) {
    return BrightnessLevel.dark;
  }

  if (value > 80) {
    return BrightnessLevel.bright;
  }

  return BrightnessLevel.normal;
}