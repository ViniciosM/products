import 'package:flutter/material.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_label.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/empty.png',
          height: 200,
        ),
        const SizedBox(
          height: PSizes.padding12,
        ),
        const PLabel(
          text: 'This list is empty',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
