import 'package:products/domain/entities/product_entity.dart';

abstract interface class AddToFavoritesUseCase {
  Future<void> call({required ProductEntity productEntity});
}
