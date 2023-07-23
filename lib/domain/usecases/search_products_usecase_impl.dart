// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/search_products_usecase.dart';

class SearchProductsUseCaseImpl implements SearchProductsUseCase {
  final ProductRepository productRepository;
  SearchProductsUseCaseImpl({
    required this.productRepository,
  });

  @override
  Future<List<ProductEntity>> call({required String text}) async {
    return await productRepository.search(text: text);
  }
}
