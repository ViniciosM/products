import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:products/data/datasources/product_datasource.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/consts/keys.dart';

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

      if (response.statusCode == 200) {
        products = ProductDTO.responseToListObject(response.data);
      }
      return products;
    } catch (e, s) {
      log('[DATASOURCE] GetProducts - Error: $e | Stacktrace $s');
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<ProductDTO>> search({required String text}) async {
    try {
      List<ProductDTO> researchedProducts = [];
      var response = await dio.get('https://fakestoreapi.com/products/');

      if (response.statusCode == 200) {
        researchedProducts = ProductDTO.responseToListObject(response.data)
            .where((product) => product.title.contains(text))
            .toList();
      }
      return researchedProducts;
    } catch (e, s) {
      log('[DATASOURCE] Search Products - Error: $e | Stacktrace $s');
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<void> addToFavorites({required ProductDTO productDTO}) async {
    try {
      List<String> jsonStringList = [];
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      String stringProduct = productDTO.toJson().toString();
      jsonStringList.add(stringProduct);
      localStorage.setStringList(Keys.favorites, jsonStringList);
    } catch (e, s) {
      log('[DATASOURCE] Add To Favorites - Error: $e | Stacktrace $s');
      throw Exception('Failed to add to favorites');
    }
  }

  @override
  Future<List<ProductDTO>> getFavorites() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      List<ProductDTO> favorites = [];
      List<String>? jsonStringList = localStorage.getStringList(Keys.favorites);

      if (jsonStringList != null) {
        favorites = jsonStringList
            .map((productString) => ProductDTO.stringToObject(productString))
            .toList();
      }
      return favorites;
    } catch (e, s) {
      log('[DATASOURCE] Get Favorites - Error: $e | Stacktrace $s');
      throw Exception('Failed to get favorites');
    }
  }
}
