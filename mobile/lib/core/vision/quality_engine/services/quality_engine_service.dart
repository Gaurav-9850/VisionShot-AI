import '../analyzers/brightness_analyzer.dart';
import '../models/quality_report.dart';

class QualityEngineService {
  final BrightnessAnalyzer _brightnessAnalyzer = BrightnessAnalyzer();

  Future<QualityReport> analyzeImage(String imagePath) async {
    final brightness = await _brightnessAnalyzer.analyze(imagePath);

    // Temporary values
    const blur = 15.0;
    const contrast = 75.0;
    const sharpness = 85.0;

    return QualityReport(
      brightness: brightness,
      blur: blur,
      contrast: contrast,
      sharpness: sharpness,
    );
  }
}