import 'package:flutter/material.dart';

import '../../core/theme/widgets/p_label.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PLabel(
          text: 'Favorites',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(),
    );
  }
}
