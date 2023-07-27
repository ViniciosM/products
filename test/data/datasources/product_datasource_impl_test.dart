import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:products/data/datasources/product_datasource_impl.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('ProductDatasourceImpl', () {
    late ProductDatasourceImpl productDatasource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      productDatasource = ProductDatasourceImpl(dio: mockDio);
    });

    test('getProducts returns list of products on 200 status code', () async {
      final responseMock = Response(data: [
        {
          "id": 1,
          "title": "Product X",
          "price": 10.0,
          "description": "Desc X",
          "category": "X",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 10}
        },
        {
          "id": 2,
          "title": "Product Y",
          "price": 20.0,
          "description": "Desc Y",
          "category": "Y",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 20}
        },
        {
          "id": 3,
          "title": "Product Z",
          "price": 30.0,
          "description": "Desc Z",
          "category": "Z",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 30}
        },
      ], statusCode: 200, requestOptions: RequestOptions(baseUrl: 'any'));

      when(() => mockDio.get(any())).thenAnswer((_) async => responseMock);

      final products = await productDatasource.getProducts();

      expect(products.length, 3);
      expect(products[0].title, 'Product X');
      expect(products[1].price, 20.0);
    });

    test('getProducts throws Exception on non-200 status code', () async {
      final responseMock = Response(
          data: null,
          statusCode: 404,
          requestOptions: RequestOptions(baseUrl: ''));

      when(() => mockDio.get(any())).thenThrow((_) async => responseMock);

      expect(
          () async => await productDatasource.getProducts(), throwsException);
    });

    test('search returns filtered products on 200 status code', () async {
      final responseMock = Response(data: [
        {
          "id": 1,
          "title": "Product X",
          "price": 10.0,
          "description": "Desc X",
          "category": "X",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 10}
        },
        {
          "id": 2,
          "title": "Product Y",
          "price": 20.0,
          "description": "Desc Y",
          "category": "Y",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 20}
        },
        {
          "id": 3,
          "title": "Product Z",
          "price": 30.0,
          "description": "Desc Z",
          "category": "Z",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 30}
        },
      ], statusCode: 200, requestOptions: RequestOptions(baseUrl: ''));

      when(() => mockDio.get(any())).thenAnswer((_) async => responseMock);

      final researchedProducts =
          await productDatasource.search(text: 'Product');

      expect(researchedProducts.length, 3);
      expect(researchedProducts[0].title, 'Product X');
      expect(researchedProducts[1].price, 20.0);
    });

    test('search returns empty list on non-200 status code', () async {
      final responseMock = Response(
          data: null,
          statusCode: 404,
          requestOptions: RequestOptions(baseUrl: ''));

      when(() => mockDio.get(any())).thenAnswer((_) async => responseMock);

      final researchedProducts =
          await productDatasource.search(text: 'Product');

      expect(researchedProducts.length, 0);
    });
  });
}
