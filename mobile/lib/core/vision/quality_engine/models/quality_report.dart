class QualityReport {
  final double brightness;
  final double contrast;
  final double blur;
  final double sharpness;

  const QualityReport({
    required this.brightness,
    required this.contrast,
    required this.blur,
    required this.sharpness,
  });

  double get overallScore {
    return (brightness + contrast + sharpness + (100 - blur)) / 4;
  }
}