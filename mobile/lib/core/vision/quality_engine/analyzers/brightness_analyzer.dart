import '../models/quality_report.dart';
import 'image_analyzer.dart';

class BrightnessAnalyzer implements ImageAnalyzer<double> {

  @override
  Future<double> analyze(String imagePath) async {

    // TODO:
    // OpenCV implementation

    return 75;

  }

}
