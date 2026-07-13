import '../quality_engine/models/quality_report.dart';

class PhotoRecommendationService {
  List<String> generate(QualityReport report) {
    final tips = <String>[];

    if (report.brightness < 30) {
      tips.add("Move to a brighter place.");
    }

    if (report.brightness > 80) {
      tips.add("Reduce exposure.");
    }

    if (report.blur > 40) {
      tips.add("Hold the camera steady.");
    }

    if (report.contrast < 40) {
      tips.add("Increase contrast.");
    }

    if (report.sharpness < 40) {
      tips.add("Tap to focus before capturing.");
    }

    if (tips.isEmpty) {
      tips.add("Excellent photo!");
    }

    return tips;
  }
}