import 'package:flutter/material.dart';
import 'package:products/presentation/product/controllers/product_state.dart';

// Atom
final productState = ValueNotifier<ProductState>(const StartProductState());

// Actions
final getProductsAction = ValueNotifier(Object());
// final createProductAction = ValueNotifier<ProductDTO>(ProductDTO());
// final updateProductAction = ValueNotifier<ProductDTO>(ProductDTO());
// final deleteProductAction = ValueNotifier<String>('');