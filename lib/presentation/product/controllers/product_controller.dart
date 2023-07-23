import 'package:products/domain/usecases/search_products_usecase.dart';
import 'package:products/presentation/product/controllers/product_atom.dart';
import 'package:products/presentation/product/controllers/product_state.dart';

import '../../../domain/usecases/get_products_usecase.dart';

class ProductController {
  final GetProductsUseCase getProductsUseCase;
  final SearchProductsUseCase searchProductsUseCase;

  ProductController(this.getProductsUseCase, this.searchProductsUseCase) {
    getProductsAction.addListener(getProducts);
  }

  Future<void> getProducts() async {
    productState.value = const LoadingProductState();
    try {
      final products = await getProductsUseCase.call();
      productState.value = GettedProductState(products);
    } catch (e) {
      productState.value = FailureProductState(e.toString());
    }
  }

  Future<void> search({required String text}) async {
    productState.value = const LoadingProductState();
    try {
      final products = await searchProductsUseCase.call(text: text);
      productState.value = GettedProductState(products);
    } catch (e) {
      productState.value = FailureProductState(e.toString());
    }
  }
}
