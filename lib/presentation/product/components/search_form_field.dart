import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/consts/p_colors.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function() onClosed;

  const SearchFormField(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.onSubmitted,
      required this.onClosed});

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
            color: PColors.primaryColor,
            fontWeight: FontWeight.w400),
        prefixIcon: const Icon(
          Icons.search,
          color: PColors.primaryColor,
          size: 20,
        ),
        suffixIcon: IconButton(
          onPressed: onClosed,
          icon: const Icon(Icons.close, color: PColors.primaryColor, size: 14),
        ),
        filled: true,
        fillColor: PColors.neutralColor,
      ),
    );
  }
}
