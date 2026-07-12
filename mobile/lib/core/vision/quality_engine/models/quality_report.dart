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
    return (brightness + contrast + sharpness + (100 - blur)) / 4;
  }
}