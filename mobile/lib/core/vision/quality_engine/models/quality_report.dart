class QualityReport {
  final double brightness;
  final double blur;
  final double contrast;
  final double sharpness;

  const QualityReport({
    required this.brightness,
    required this.blur,
    required this.contrast,
    required this.sharpness,
  });

  double get overallScore {
    const brightnessWeight = 0.30;
    const contrastWeight = 0.20;
    const sharpnessWeight = 0.30;
    const blurWeight = 0.20;

    return (brightness * brightnessWeight) +
        (contrast * contrastWeight) +
        (sharpness * sharpnessWeight) +
        ((100 - blur) * blurWeight);
  }

  bool get isDark => brightness < 30;

  bool get isBright => brightness > 80;

  bool get isBlurry => blur > 40;

  bool get hasLowContrast => contrast < 40;

  bool get isSharp => sharpness > 60;
}