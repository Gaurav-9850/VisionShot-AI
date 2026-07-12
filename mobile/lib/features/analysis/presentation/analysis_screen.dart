import 'package:flutter/material.dart';

import '../../../core/vision/quality_engine/models/quality_report.dart';

class AnalysisScreen extends StatelessWidget {
  final QualityReport report;

  const AnalysisScreen({
    super.key,
    required this.report,
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
              "Blur : ${report.blur.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Text(
              "Sharpness : ${report.sharpness.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20),
            ),

            const Divider(height: 40),

            Text(
              "Overall Score : ${report.overallScore.toStringAsFixed(1)}%",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}