import 'package:flutter/material.dart';

class ProgressTile extends StatelessWidget {

  final String title;

  final double value;

  const ProgressTile({

    super.key,

    required this.title,

    required this.value,

  });

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:

      CrossAxisAlignment.start,

      children: [

        Text(

          title,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

        const SizedBox(height: 6),

        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            minHeight: 12,
            value: value / 100,
          ),
        ),

        const SizedBox(height: 4),

        Text(

          "${value.toStringAsFixed(1)}%",

        ),

      ],

    );

  }

}