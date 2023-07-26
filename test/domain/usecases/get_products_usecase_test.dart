import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/entities/rating_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/get_products_usecase.dart';
import 'package:products/domain/usecases/get_products_usecase_impl.dart';

class ProductRepositoryMock extends Mock implements ProductRepository {}

void main() {
  late ProductRepository productRepositoryMock;
  late GetProductsUseCase getProductsUseCase;
  late List<ProductEntity> productsMock;

  setUpAll(() {
    productRepositoryMock = ProductRepositoryMock();
    getProductsUseCase =
        GetProductsUseCaseImpl(productRepository: productRepositoryMock);

    productsMock = [
      ProductEntity(
          id: 1,
          title: 'Product X',
          price: 50.0,
          description: 'Description X',
          category: 'X',
          image: 'www.someurl.com/x.png',
          rating: RatingEntity(count: 10, rate: 4.5)),
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
    test('should get products correctly', () async {
      when(() => productRepositoryMock.getProducts())
          .thenAnswer((_) async => productsMock);

      final result = await getProductsUseCase();

      expect(result, productsMock);
      expect(result.length, 2);
      expect(result.first.category, 'X');
      expect(result.isNotEmpty, true);
      expect(result.isEmpty, false);
    });
  });
}
