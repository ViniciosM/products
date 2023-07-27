import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products/core/shared/components/rating_product.dart';
import 'package:products/core/theme/widgets/p_label.dart';
import 'package:products/data/dtos/rating_dto.dart';

void main() {
  testWidgets('[UI] - RatingProduct Component', (tester) async {
    RatingDTO ratingDTO = RatingDTO(count: 10, rate: 4.5);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatingProduct(
            rating: ratingDTO,
          ),
        ),
      ),
    );

    expect(find.byType(PLabel), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });
}
