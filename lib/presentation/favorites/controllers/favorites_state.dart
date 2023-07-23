import '../../../domain/entities/product_entity.dart';

sealed class FavoritesState {
  const FavoritesState();
}

class StartFavoritesState extends FavoritesState {
  const StartFavoritesState();
}

class GettedFavoritesState extends FavoritesState {
  final List<ProductEntity> favorites;

  const GettedFavoritesState(this.favorites);
}

class LoadingFavoritesState extends FavoritesState {
  const LoadingFavoritesState();
}

class FailureFavoritesState extends FavoritesState {
  final String message;
  const FailureFavoritesState(this.message);
}
