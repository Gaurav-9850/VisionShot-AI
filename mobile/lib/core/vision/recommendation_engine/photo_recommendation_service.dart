import '../quality_engine/models/quality_report.dart';

class PhotoRecommendationService {

  List<String> generate(
    QualityReport report,
  ) {

    final recommendations = <String>[];

    if (report.isDark) {
      recommendations.add(
        "Move to a brighter area."
      );
    }

    if (report.isBright) {
      recommendations.add(
        "Reduce exposure."
      );
    }

    if (report.isBlurry) {
      recommendations.add(
        "Hold the phone steady."
      );
    }

    if (report.hasLowContrast) {
      recommendations.add(
        "Increase contrast."
      );
    }

    if (!report.isSharp) {
      recommendations.add(
        "Tap to focus before capturing."
      );
    }

    if (recommendations.isEmpty) {
      recommendations.add(
        "Excellent photo!"
      );
    }

    return recommendations;
  }
}