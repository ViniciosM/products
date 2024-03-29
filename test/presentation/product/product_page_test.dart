// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:modular_test/modular_test.dart';
// import 'package:products/domain/entities/product_entity.dart';
// import 'package:products/domain/entities/rating_entity.dart';
// import 'package:products/domain/usecases/get_products_usecase.dart';
// import 'package:products/domain/usecases/search_products_usecase.dart';
// import 'package:products/presentation/product/controllers/product_controller.dart';
// import 'package:products/presentation/product/product_module.dart';
// import 'package:products/presentation/product/product_page.dart';

// class ProductControllerMock extends Mock implements ProductController {}

// class GetProductsUseCaseMock extends Mock implements GetProductsUseCase {}

// class SearchProductsUseCaseMock extends Mock implements SearchProductsUseCase {}

// void main() {
//   late ProductController productController;
//   late GetProductsUseCase getProductsUseCaseMock;
//   late SearchProductsUseCase searchProductsUseCaseMock;
//   // when(productControllerMock.getProducts)
//   //     .thenAnswer((_) async => Future.value());

//   late RatingEntity ratingEntity;
//   late ProductEntity productEntity;
//   setUp(() {
//     getProductsUseCaseMock = GetProductsUseCaseMock();
//     searchProductsUseCaseMock = SearchProductsUseCaseMock();
//     productController =
//         ProductController(getProductsUseCaseMock, searchProductsUseCaseMock);
//     ratingEntity = RatingEntity(count: 10, rate: 4.5);

//     productEntity = ProductEntity(
//       id: 1,
//       title: 'Product X',
//       price: 50.0,
//       description: 'Description X',
//       category: 'X',
//       image: 'www.someurl.com/x.png',
//       rating: ratingEntity,
//     );

//     initModule(ProductModule(), replaceBinds: [
//       Bind.instance<ProductController>(productController),
//     ]);
//   });

//   group('[UI] - ProductPage', () {
//     testWidgets('should build product page correctly', (tester) async {
//       await tester.pumpWidget(const MaterialApp(
//         home: ProductPage(),
//       ));

//       expect(find.byType(Scaffold), findsOneWidget);
//       expect(find.byType(AppBar), findsOneWidget);
//     });
//   });
// }
