// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/get_products_usecase.dart';

class GetProductsUseCaseImpl implements GetProductsUseCase {
  final ProductRepository productRepository;
  GetProductsUseCaseImpl({
    required this.productRepository,
  });

  @override
  Future<List<ProductEntity>> call() async {
    return await productRepository.getProducts();
  }
}
