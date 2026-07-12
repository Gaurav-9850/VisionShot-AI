import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {

  final String imagePath;

  const AnalysisScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Image Analysis"),
      ),

      body: const Center(

        child: CircularProgressIndicator(),

      ),

    );

  }

}