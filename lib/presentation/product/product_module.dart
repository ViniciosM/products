import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/presentation/favorites/controllers/favorites_controller.dart';
import 'package:products/presentation/favorites/favorites_page.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/product_page.dart';

import '../product_details/product_detail_page.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => FavoritesController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            Modular.get<ProductController>().getProducts();
            return const ProductPage();
          },
        ),
        ChildRoute(
          '/details',
          child: (context, args) => ProductDetailsPage(
            product: args.data,
          ),
        ),
        ChildRoute(
          '/favorites',
          child: (context, args) {
            Modular.get<FavoritesController>().getFavorites();
            return const FavoritesPage();
          },
        ),
      ];
}
