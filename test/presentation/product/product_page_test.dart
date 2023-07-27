import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/entities/rating_entity.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/product_module.dart';
import 'package:products/presentation/product/product_page.dart';

class ProductControllerMock extends Mock implements ProductController {}

void main() {
  final ProductController productControllerMock = ProductControllerMock();
  when(productControllerMock.getProducts)
      .thenAnswer((_) async => Future.value());

  late RatingEntity ratingEntity;
  late ProductEntity productEntity;
  setUp(() {
    ratingEntity = RatingEntity(count: 10, rate: 4.5);

    productEntity = ProductEntity(
      id: 1,
      title: 'Product X',
      price: 50.0,
      description: 'Description X',
      category: 'X',
      image: 'www.someurl.com/x.png',
      rating: ratingEntity,
    );

    initModule(ProductModule(), replaceBinds: [
      Bind.instance<ProductController>(productControllerMock),
    ]);
  });

  group('[UI] - ProductPage', () {
    testWidgets('should build product page correctly', (tester) async {
      // whenListen(
      //   meuBlocMock,
      //   initialState: const EmptyState(),
      //   Stream<BaseState>.fromIterable([]),
      // );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductPage(),
          ),
        ),
      );
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
    // testWidgets('quando for LoadingState', (tester) async {
    //   whenListen(
    //     meuBlocMock,
    //     initialState: const LoadingState(),
    //     Stream<BaseState>.fromIterable([
    //       const LoadingState(),
    //     ]),
    //   );

    //   await tester.pumpWidget(
    //     const MaterialApp(
    //       home: Scaffold(
    //         body: MeuPage(),
    //       ),
    //     ),
    //   );
    //   expect(find.byType(CircularProgressIndicator), findsNWidgets(1));
    // });
    // testWidgets('quando for ErrorState', (tester) async {
    //   whenListen(
    //     meuBlocMock,
    //     initialState: const ErrorState('error'),
    //     Stream<BaseState>.fromIterable([
    //       const ErrorState('error'),
    //     ]),
    //   );

    //   await tester.pumpWidget(
    //     const MaterialApp(
    //       home: Scaffold(
    //         body: MeuPage(),
    //       ),
    //     ),
    //   );
    //   expect(find.text('error'), findsNWidgets(1));
    // });
    // testWidgets('quando for SuccessState', (tester) async {
    //   whenListen(
    //     meuBlocMock,
    //     initialState: SuccessState(addressMock),
    //     Stream<BaseState>.fromIterable([
    //       SuccessState(addressMock),
    //     ]),
    //   );

    //   await tester.pumpWidget(
    //     const MaterialApp(
    //       home: Scaffold(
    //         body: MeuPage(),
    //       ),
    //     ),
    //   );
    //   expect(find.byType(MeuRow), findsNWidgets(4));
    // });
  });
}
