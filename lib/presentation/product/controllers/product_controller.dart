import 'package:flutter/material.dart';
import 'package:products/domain/usecases/get_products_usecase.dart';
import 'package:products/presentation/product/controllers/product_atom.dart';
import 'package:products/presentation/product/controllers/product_state.dart';

class ProductController {
  final GetProductsUseCase getProductsUseCase;

  // Future<List<ProductDTO>> getProducts() async {
  //   List<ProductEntity> products = await getProductsUseCase.call();
  //   return products.map((p) => ProductDTO.fromEntity(p)).toList();
  // }

  ProductController(this.getProductsUseCase) {
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
}
