import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/usecases/add_to_favorites_usecase.dart';

import '../repositories/product_repository.dart';

class AddToFavoritesUseCaseImpl implements AddToFavoritesUseCase {
  final ProductRepository productRepository;
  AddToFavoritesUseCaseImpl({
    required this.productRepository,
  });

  @override
  Future<void> call({required ProductEntity productEntity}) async {
    await productRepository.addToFavorites(productEntity: productEntity);
  }
}
