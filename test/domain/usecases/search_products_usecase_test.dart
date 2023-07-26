import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/entities/rating_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/search_products_usecase.dart';
import 'package:products/domain/usecases/search_products_usecase_impl.dart';

class ProductRepositoryMock extends Mock implements ProductRepository {}

void main() {
  late ProductRepository productRepositoryMock;
  late SearchProductsUseCase searchProductsUseCase;
  late List<ProductEntity> productsMock;

  setUpAll(() {
    productRepositoryMock = ProductRepositoryMock();
    searchProductsUseCase =
        SearchProductsUseCaseImpl(productRepository: productRepositoryMock);

    productsMock = [
      ProductEntity(
          id: 2,
          title: 'Product Y',
          price: 70.0,
          description: 'Description Y',
          category: 'Y',
          image: 'www.someurl.com/y.png',
          rating: RatingEntity(count: 5, rate: 4.8))
    ];
  });
  group('[DOMAIN] - GetProductsUseCase', () {
    test('should search products correctly', () async {
      // Given
      String textSearch = 'Product Y';

      // When
      when(() => productRepositoryMock.search(text: textSearch))
          .thenAnswer((_) async => productsMock);

      final result = await searchProductsUseCase(text: textSearch);

      // Then
      expect(result.length, 1);
      expect(result.first.description, 'Description Y');
      expect(result.first.category, 'Y');
      expect(result.isNotEmpty, true);
      expect(result.isEmpty, false);
    });
  });
}
