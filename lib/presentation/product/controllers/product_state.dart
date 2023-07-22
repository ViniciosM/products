import '../../../domain/entities/product_entity.dart';

sealed class ProductState {
  const ProductState();
}

class StartProductState extends ProductState {
  const StartProductState();
}

class GettedProductState extends ProductState {
  final List<ProductEntity> products;

  const GettedProductState(this.products);
}

class LoadingProductState extends ProductState {
  const LoadingProductState();
}

class FailureProductState extends ProductState {
  final String message;
  const FailureProductState(this.message);
}
