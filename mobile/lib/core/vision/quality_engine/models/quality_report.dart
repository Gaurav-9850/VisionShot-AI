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
}