import '../models/image_quality.dart';

class VisionService {

  Future<ImageQuality> analyzeImage(
    String imagePath,
  ) async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return ImageQuality(

      brightness: 78,

      contrast: 70,

      blur: 10,

      sharpness: 90,

      isDark: false,

      isBlurry: false,

    );

  }

}