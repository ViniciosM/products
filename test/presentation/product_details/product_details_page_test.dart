// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:products/data/dtos/product_dto.dart';
// import 'package:products/data/dtos/rating_dto.dart';
// import 'package:products/presentation/product_details/product_details_page.dart';

// void main() {
//   testWidgets('[UI] - RatingProduct Component', (tester) async {
//     RatingDTO ratingDTO = RatingDTO(count: 10, rate: 4.5);
//     ProductDTO productDTO = ProductDTO(
//       id: 1,
//       title: 'Product X',
//       price: 50.0,
//       description: 'Description X',
//       category: 'X',
//       image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
//       rating: ratingDTO,
//     );
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: ProductDetailsPage(
//             product: productDTO,
//           ),
//         ),
//       ),
//     );

//     expect(find.byType(Scaffold), findsOneWidget);
//   });
// }
