import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final double score;

  const ScoreCard({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    Color scoreColor;

    if (score >= 80) {
      scoreColor = Colors.green;
    } else if (score >= 60) {
      scoreColor = Colors.orange;
    } else {
      scoreColor = Colors.red;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Overall Score",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            CircleAvatar(
              radius: 45,
              backgroundColor: scoreColor,
              child: Text(
                score.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              score >= 80
                  ? "Excellent"
                  : score >= 60
                      ? "Good"
                      : "Needs Improvement",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}