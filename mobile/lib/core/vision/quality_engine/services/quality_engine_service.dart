import '../analyzers/brightness_analyzer.dart';
import '../models/quality_report.dart';
import '../analyzers/blur_analyzer.dart';

class QualityEngineService {
  final BrightnessAnalyzer _brightnessAnalyzer = BrightnessAnalyzer();

  Future<QualityReport> analyzeImage(String imagePath) async {
    // Calculate real brightness
    final brightness = await _brightnessAnalyzer.analyze(imagePath);

    
    final blurAnalyzer = BlurAnalyzer();

    final blur = await blurAnalyzer.analyze(imagePath);
    
    // Temporary placeholder values
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