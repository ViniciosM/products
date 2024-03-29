import 'package:products/domain/entities/product_entity.dart';

abstract interface class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> search({required String text});
  Future<void> addToFavorites({required ProductEntity productEntity});
  Future<List<ProductEntity>> getFavorites();
}
