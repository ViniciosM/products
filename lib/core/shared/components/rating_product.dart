import 'package:flutter/material.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/data/dtos/rating_dto.dart';

import '../../theme/widgets/p_label.dart';

class RatingProduct extends StatelessWidget {
  const RatingProduct({required this.rating, super.key});

  final RatingDTO rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: PSizes.size8,
        ),
        PLabel(text: '${rating.rate} (${rating.count} reviews)'),
      ],
    );
  }
}
