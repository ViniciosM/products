import '../dtos/product_dto.dart';

abstract interface class ProductDatasource {
  Future<List<ProductDTO>> getProducts();
  Future<List<ProductDTO>> search({required String text});
  Future<void> addToFavorites({required ProductDTO productDTO});
  Future<List<ProductDTO>> getFavorites();
}
