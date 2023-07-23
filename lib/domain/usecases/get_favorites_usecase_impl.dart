import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/get_favorites_usecase.dart';

class GetFavoritesUseCaseImpl implements GetFavoritesUseCase {
  final ProductRepository productRepository;
  GetFavoritesUseCaseImpl({
    required this.productRepository,
  });

  @override
  Future<List<ProductEntity>> call() async {
    return await productRepository.getFavorites();
  }
}
