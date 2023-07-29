import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products/core/shared/components/something_wrong.dart';
import 'package:products/core/theme/widgets/p_label.dart';

void main() {
  testWidgets('[UI] - Something Wrong Component', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SomethingWrong(),
        ),
      ),
    );

    expect(find.byType(PLabel), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
