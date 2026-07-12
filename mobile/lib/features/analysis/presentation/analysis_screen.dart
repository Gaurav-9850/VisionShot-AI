import 'package:flutter/material.dart';

import '../../../core/vision/quality_engine/models/quality_report.dart';
import 'dart:io';
import '../../../shared/widgets/progress_tile.dart';
import '../../gallery/services/gallery_service.dart';


class AnalysisScreen extends StatelessWidget {
  final QualityReport report;

  final String imagePath;

  const AnalysisScreen({
    super.key,
    required this.report,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Analysis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(

              borderRadius: BorderRadius.circular(20),

              child: Image.file(

              File(imagePath),

              height: 250,

              width: double.infinity,

              fit: BoxFit.cover,

              ),

            ),

            Text(
              "Brightness : ${report.brightness.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Text(
              "Contrast : ${report.contrast.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Text(
              "Blur : ${report.blur.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Text(
              "Sharpness : ${report.sharpness.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            const Text(
              "Recommendations",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Retake"),
                ),

                FilledButton(
                  onPressed: () async {
                    final gallery = GalleryService();

                    final savedPath = await gallery.saveImage(imagePath);

                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Saved Successfully\n$savedPath",
                        ),
                      ),
                    );
                  },
                  child: const Text("Save"),
                )

              ],
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text("Lighting looks good."),
            ),

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text("Image is sharp."),
            ),

          ],
        ),
      ),
    );
  }
}