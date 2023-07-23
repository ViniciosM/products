import 'package:products/data/dtos/product_dto.dart';
import 'package:products/domain/usecases/add_to_favorites_usecase.dart';
import 'package:products/domain/usecases/get_favorites_usecase.dart';
import 'package:products/presentation/favorites/controllers/favorites_atom.dart';
import 'package:products/presentation/favorites/controllers/favorites_state.dart';

class FavoritesController {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesController(this.addToFavoritesUseCase, this.getFavoritesUseCase) {
    getFavoritesAction.addListener(getFavorites);
  }

  Future<void> getFavorites() async {
    favoritesState.value = const LoadingFavoritesState();
    try {
      final favorites = await getFavoritesUseCase.call();
      favoritesState.value = GettedFavoritesState(favorites);
    } catch (e) {
      favoritesState.value = FailureFavoritesState(e.toString());
    }
  }

  Future<void> addToFavorites({required ProductDTO productDTO}) async {
    try {
      await addToFavoritesUseCase.call(
          productEntity: ProductDTO.entityToDTO(productDTO));
    } catch (e) {
      favoritesState.value = FailureFavoritesState(e.toString());
    }
  }
}
