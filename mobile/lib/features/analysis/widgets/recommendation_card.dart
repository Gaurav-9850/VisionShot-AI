import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String tip;

  const RecommendationCard({
    super.key,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(
          Icons.lightbulb,
          color: Colors.amber,
        ),
        title: Text(tip),
      ),
    );
  }
}