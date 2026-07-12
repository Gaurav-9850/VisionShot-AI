import '../models/image_analysis.dart';

class ImageAnalysisService {

  Future<ImageAnalysis> analyzeImage(String imagePath) async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return ImageAnalysis(

      brightness: 82,

      contrast: 71,

      blur: 12,

      sharpness: 94,

    );

  }

}