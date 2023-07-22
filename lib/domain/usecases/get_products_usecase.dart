import 'package:products/domain/entities/product_entity.dart';

abstract interface class GetProductsUseCase {
  Future<List<ProductEntity>> call();
}
