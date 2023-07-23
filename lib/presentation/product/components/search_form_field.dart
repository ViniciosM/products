import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/core/theme/widgets/p_label.dart';

import '../../../core/theme/consts/p_colors.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmitted;

  const SearchFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: 'Search Anything',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        labelStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: PColors.darkColor,
        ),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
