// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products/data/datasources/product_datasource.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductDatasource productDatasource;
  ProductRepositoryImpl({
    required this.productDatasource,
  });

  @override
  Future<List<ProductEntity>> getProducts() async {
    List<ProductDTO> products = await productDatasource.getProducts();
    return ProductDTO.toEntityFromList(products);
  }
}
