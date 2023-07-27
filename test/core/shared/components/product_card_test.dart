import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:products/core/shared/components/product_card.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/data/dtos/rating_dto.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/product_module.dart';

class ProductControllerMock extends Mock implements ProductController {}

void main() {
  late ProductController productControllerMock;
  late RatingDTO ratingDTO;
  late ProductDTO productDTO;

  setUp(() {
    ratingDTO = RatingDTO(count: 10, rate: 4.5);

    productDTO = ProductDTO(
      id: 1,
      title: 'Product X',
      price: 50.0,
      description: 'Description X',
      category: 'X',
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      rating: ratingDTO,
    );
    productControllerMock = ProductControllerMock();
    initModule(ProductModule(), replaceBinds: [
      Bind.instance<ProductController>(productControllerMock),
    ]);
  });

  testWidgets('[UI] - ProductCard Component', (tester) async {
    await tester.pumpWidget(
      ProductCard(
        product: productDTO,
      ),
    );

    // expect(find.text('title'), findsOneWidget);
    // expect(find.text('description'), findsOneWidget);
    // expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}
