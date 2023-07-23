import 'package:products/domain/entities/product_entity.dart';

abstract interface class GetFavoritesUseCase {
  Future<List<ProductEntity>> call();
}
