import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class GalleryService {
  Future<String> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();

    final galleryFolder = Directory(
      "${directory.path}/visionshot",
    );

    if (!galleryFolder.existsSync()) {
      galleryFolder.createSync(recursive: true);
    }

    final imageName = basename(imagePath);

    final savedImage = await File(imagePath).copy(
      "${galleryFolder.path}/$imageName",
    );

    return savedImage.path;
  }
}