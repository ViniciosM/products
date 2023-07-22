import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/data/datasources/product_datasource.dart';
import 'package:products/data/datasources/product_datasource_impl.dart';
import 'package:products/data/repositories/product_repository_impl.dart';
import 'package:products/domain/repositories/product_repository.dart';
import 'package:products/domain/usecases/get_products_usecase.dart';
import 'package:products/domain/usecases/get_products_usecase_impl.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/product_module.dart';
import 'package:products/presentation/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];
  @override
  final List<Bind> binds = [
    // HTTP
    Bind.lazySingleton((i) => Dio()),

    // CONTROLLER
    Bind.lazySingleton((i) => ProductController(i())),

    // USECASES
    Bind.lazySingleton<GetProductsUseCase>(
        (i) => GetProductsUseCaseImpl(productRepository: i())),

    // REPOSITORIES
    Bind.lazySingleton<ProductRepository>(
        (i) => ProductRepositoryImpl(productDatasource: i())),

    // DATASOURCES
    Bind.lazySingleton<ProductDatasource>(
        (i) => ProductDatasourceImpl(dio: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    ModuleRoute('/product', module: ProductModule()),
  ];
}
