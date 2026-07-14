import '../analyzers/brightness_analyzer.dart';
import '../analyzers/blur_analyzer.dart';
import '../analyzers/contrast_analyzer.dart';
import '../analyzers/sharpness_analyzer.dart';
import '../models/quality_report.dart';

class QualityEngineService {
  final BrightnessAnalyzer _brightnessAnalyzer =
      BrightnessAnalyzer();

  final BlurAnalyzer _blurAnalyzer =
      BlurAnalyzer();

  final ContrastAnalyzer _contrastAnalyzer =
      ContrastAnalyzer();

  final SharpnessAnalyzer _sharpnessAnalyzer =
      SharpnessAnalyzer();

  Future<QualityReport> analyzeImage(
    String imagePath,
  ) async {

    final brightness =
        await _brightnessAnalyzer.analyze(imagePath);

    final blur =
        await _blurAnalyzer.analyze(imagePath);

    final contrast =
        await _contrastAnalyzer.analyze(imagePath);

    final sharpness =
        await _sharpnessAnalyzer.analyze(imagePath);

    return QualityReport(
      brightness: brightness,
      blur: blur,
      contrast: contrast,
      sharpness: sharpness,
    );
  }
}