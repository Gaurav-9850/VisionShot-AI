import '../analyzers/brightness_analyzer.dart';
import '../analyzers/blur_analyzer.dart';
import '../analyzers/contrast_analyzer.dart';
import '../analyzers/sharpness_analyzer.dart';
import '../models/quality_report.dart';

class QualityEngineService {
  final _brightness = BrightnessAnalyzer();
  final _blur = BlurAnalyzer();
  final _contrast = ContrastAnalyzer();
  final _sharpness = SharpnessAnalyzer();

  Future<QualityReport> analyzeImage(String path) async {
    final brightness = await _brightness.analyze(path);
    final blur = await _blur.analyze(path);
    final contrast = await _contrast.analyze(path);
    final sharpness = await _sharpness.analyze(path);

    return QualityReport(
      brightness: brightness,
      blur: blur,
      contrast: contrast,
      sharpness: sharpness,
    );
  }
}