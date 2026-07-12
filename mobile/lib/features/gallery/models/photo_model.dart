class PhotoModel {
  final String imagePath;

  final double score;

  final DateTime capturedAt;

  const PhotoModel({
    required this.imagePath,
    required this.score,
    required this.capturedAt,
  });
}
