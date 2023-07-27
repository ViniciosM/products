import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products/data/datasources/product_datasource.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/data/dtos/rating_dto.dart';
import 'package:products/data/repositories/product_repository_impl.dart';
import 'package:products/domain/repositories/product_repository.dart';

class ProductDatasourceMock extends Mock implements ProductDatasource {}

void main() {
  late ProductDatasource productDatasourceMock;
  late ProductRepository productRepository;
  late List<ProductDTO> products;
  late RatingDTO ratingDTO;

  setUpAll(() {
    productDatasourceMock = ProductDatasourceMock();
    productRepository =
        ProductRepositoryImpl(productDatasource: productDatasourceMock);

    ratingDTO = RatingDTO(count: 10, rate: 4.5);
    products = [
      ProductDTO(
        id: 1,
        title: 'Product X',
        price: 50.0,
        description: 'Description X',
        category: 'X',
        image: 'www.someurl.com/x.png',
        rating: ratingDTO,
      ),
      ProductDTO(
        id: 2,
        title: 'Product Y',
        price: 50.0,
        description: 'Description Y',
        category: 'Y',
        image: 'www.someurl.com/y.png',
        rating: ratingDTO,
      ),
      ProductDTO(
        id: 3,
        title: 'Product Z',
        price: 99.99,
        description: 'Description Z',
        category: 'X',
        image: 'www.someurl.com/z.png',
        rating: ratingDTO,
      ),
    ];
  });
  group('[DATA] - ProductRepositoryImpl', () {
    test('should return a list of products', () async {
      // arrange
      when(() => productDatasourceMock.getProducts())
          .thenAnswer((_) async => products);
      // act
      var result = await productRepository.getProducts();
      // assert
      expect(result.length, 3);
      expect(result.first.category, 'X');
      expect(result.isNotEmpty, true);
      expect(result.isEmpty, false);
      expect(result[2].price, 99.99);
    });

    test('should search by text and return a list of products', () async {
      // arrange
      when(() => productDatasourceMock.search(text: 'Product'))
          .thenAnswer((_) async => products);
      // act
      var result = await productRepository.search(text: 'Product');
      // assert
      expect(result.length, 3);
      expect(result.first.description, 'Description X');
      expect(result.isNotEmpty, true);
      expect(result.isEmpty, false);
      expect(result[1].price, 50.0);
    });
  });
}
