import 'package:flutter/material.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_label.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/something_wrong.png',
          height: 200,
        ),
        const SizedBox(
          height: PSizes.padding12,
        ),
        const PLabel(
          text: 'Something went wrong!',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
