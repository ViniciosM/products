import 'package:products/domain/entities/product_entity.dart';

abstract interface class SearchProductsUseCase {
  Future<List<ProductEntity>> call({required String text});
}
