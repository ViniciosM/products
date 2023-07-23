import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:products/data/datasources/product_datasource.dart';
import 'package:products/data/dtos/product_dto.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final Dio dio;
  ProductDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<ProductDTO>> getProducts() async {
    try {
      List<ProductDTO> products = [];
      var response = await dio.get('https://fakestoreapi.com/products/');
      log('RESPONSE ${response.data}');
      if (response.statusCode == 200) {
        products = ProductDTO.responseToListObject(response.data);
      }
      return products;
    } catch (e, s) {
      log('[DATASOURCE] GetProducts - Error: $e | Stacktrace $s');
      throw Exception('Something went wrong');
    }
  }
}
