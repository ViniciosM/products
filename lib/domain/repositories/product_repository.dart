import 'package:products/domain/entities/product_entity.dart';

abstract interface class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
