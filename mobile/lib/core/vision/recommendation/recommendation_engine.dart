class RecommendationEngine {

  List<String> generateRecommendations({

    required double brightness,

    required double blur,

  }) {

    List<String> tips = [];

    if (brightness < 30) {
      tips.add("Move to a brighter area.");
    }

    if (blur > 40) {
      tips.add("Hold the phone steady.");
    }

    return tips;
  }

}