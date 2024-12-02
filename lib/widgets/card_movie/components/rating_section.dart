import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.rating,
  });

  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 50,
          child: Center(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: CircularProgressIndicator(
                value: rating! / 10,
                backgroundColor: Colors.grey,
                color: colorsRating(rating!),
                semanticsLabel: '$rating',
                strokeWidth: 5,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${(rating! * 10).truncate()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color colorsRating(double rating) {
    if (rating < 7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
