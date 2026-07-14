import 'package:flutter/material.dart';

import '../../../core/vision/quality_engine/models/quality_report.dart';

import 'dart:io';
import '../../../shared/widgets/progress_tile.dart';
import '../../gallery/services/gallery_service.dart';
import '../../../core/vision/recommendation_engine/photo_recommendation_service.dart';
import '../widgets/score_card.dart';
import '../widgets/recommendation_card.dart';


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

      final recommendations =
      PhotoRecommendationService().generate(report);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Analysis"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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

            ProgressTile(
              title: "Brightness",
              value: report.brightness,
            ),

            const SizedBox(height: 20),

            ProgressTile(
              title: "Contrast",
              value: report.contrast,
            ),

            const SizedBox(height: 20),

            ProgressTile(
              title: "Blur",
              value: report.blur,
            ),

            const SizedBox(height: 20),

            ProgressTile(
              title: "Sharpness",
              value: report.sharpness,
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 20),

            ScoreCard(
              score: report.overallScore,
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

            

            const SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recommendations
                  .map(
                    (tip) => RecommendationCard(
                      tip: tip,
                    ),
                  )
                  .toList(),
            ),

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

           ],
          ),
        ),
      ),
    );
  }
}