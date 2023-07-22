import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/presentation/product/controllers/product_atom.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/controllers/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productController = Modular.get<ProductController>();

  @override
  void initState() {
    productState.value = const StartProductState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductsAction.value = Object();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListenableBuilder(
        listenable: productState,
        builder: (context, child) {
          return switch (productState.value) {
            StartProductState _ => const SizedBox.shrink(),
            LoadingProductState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            GettedProductState state => _gettedClients(state),
            FailureProductState state => _failure(state),
          };
        },
      ),
    );
  }

  Widget _gettedClients(GettedProductState state) {
    final products = state.products;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return ListTile(
          onTap: () {
            //Navigator.of(context).pushNamed('/edit', arguments: client);
          },
          title: Text(product.title),
          subtitle: Text(product.description),
        );
      },
    );
  }

  Widget _failure(FailureProductState state) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          getProductsAction.value = Object();
        },
        child: Text(state.message),
      ),
    );
  }
}
