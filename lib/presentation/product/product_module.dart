import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/product_page.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) {
          Modular.get<ProductController>().getProducts();
          return const ProductPage();
        })
      ];
}
