import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/core/shared/components/product_card.dart';
import 'package:products/core/shared/components/something_wrong.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_circular_progress_indicator.dart';
import 'package:products/core/theme/widgets/p_label.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/presentation/favorites/controllers/favorites_atom.dart';
import 'package:products/presentation/favorites/controllers/favorites_controller.dart';
import 'package:products/presentation/favorites/controllers/favorites_state.dart';
import 'package:products/presentation/product/components/empty_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

ScrollController _scrollController = ScrollController();

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesController = Modular.get<FavoritesController>();

  @override
  void initState() {
    favoritesState.value = const StartFavoritesState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getFavoritesAction.value = Object();
    });
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: PSizes.size10,
            ),
            ListenableBuilder(
              listenable: favoritesState,
              builder: (context, child) {
                return switch (favoritesState.value) {
                  StartFavoritesState _ => const SizedBox.shrink(),
                  LoadingFavoritesState _ => const Expanded(
                      child: Center(
                        child: PCircularProgressIndicator(),
                      ),
                    ),
                  GettedFavoritesState state => _gettedFavorites(state),
                  FailureFavoritesState state => _failure(state),
                };
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _gettedFavorites(GettedFavoritesState state) {
    final favorites = state.favorites;
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: favorites.length,
        itemBuilder: (_, index) {
          final favorite = favorites[index];
          return favorites.isNotEmpty
              ? ProductCard(product: ProductDTO.fromEntity(favorite))
              : const EmptyList();
        },
      ),
    );
  }

  Widget _failure(FailureFavoritesState state) {
    return const Center(
      child: SomethingWrong(),
    );
  }
}
