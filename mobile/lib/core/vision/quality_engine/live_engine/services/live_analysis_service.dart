import '../models/live_analysis.dart';

class LiveAnalysisService {

  LiveAnalysis analyze({

    required double brightness,

    required double blur,

  }) {

    if (brightness < 30) {

      return const LiveAnalysis(

        score: 35,

        message: "Increase lighting",

        canCapture: false,

      );

    }

    if (blur > 40) {

      return const LiveAnalysis(

        score: 55,

        message: "Hold phone steady",

        canCapture: false,

      );

    }

    return const LiveAnalysis(

      score: 92,

      message: "Ready to Capture",

      canCapture: true,

    );

  }

}