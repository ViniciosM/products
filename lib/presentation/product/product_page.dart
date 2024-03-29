import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/core/shared/components/product_card.dart';
import 'package:products/core/shared/components/something_wrong.dart';
import 'package:products/core/theme/consts/p_colors.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_circular_progress_indicator.dart';
import 'package:products/core/theme/widgets/p_label.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/presentation/product/components/empty_list.dart';
import 'package:products/presentation/product/components/search_form_field.dart';
import 'package:products/presentation/product/controllers/product_atom.dart';
import 'package:products/presentation/product/controllers/product_controller.dart';
import 'package:products/presentation/product/controllers/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

GlobalKey _key = GlobalKey();
ScrollController _scrollController = ScrollController();
late TextEditingController _searchEC;

class _ProductPageState extends State<ProductPage> {
  final productController = Modular.get<ProductController>();

  @override
  void initState() {
    _searchEC = TextEditingController();
    productState.value = const StartProductState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductsAction.value = Object();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const PLabel(
          text: 'Products',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: PColors.darkColor,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.pushNamed('/product/favorites');
              },
              icon: const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.size20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: PSizes.size10,
            ),
            SearchFormField(
                controller: _searchEC,
                onChanged: (text) async {
                  Future.delayed(const Duration(seconds: 1), () {
                    productController.search(text: text);
                  });
                },
                onClosed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  productController.search(text: '');
                  _searchEC.text = '';
                },
                onSubmitted: (text) {}),
            const SizedBox(
              height: PSizes.size20,
            ),
            ListenableBuilder(
              listenable: productState,
              builder: (context, child) {
                return switch (productState.value) {
                  StartProductState _ => const SizedBox.shrink(),
                  LoadingProductState _ => const Expanded(
                      child: Center(
                        child: PCircularProgressIndicator(),
                      ),
                    ),
                  GettedProductState state => _gettedProducts(state),
                  FailureProductState state => _failure(state),
                };
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _gettedProducts(GettedProductState state) {
    final products = state.products;
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return products.isNotEmpty
              ? InkWell(
                  onTap: () {
                    Modular.to.pushNamed('/product/details',
                        arguments: ProductDTO.fromEntity(product));
                  },
                  child: ProductCard(product: ProductDTO.fromEntity(product)),
                )
              : const EmptyList();
        },
      ),
    );
  }

  Widget _failure(FailureProductState state) {
    return const Center(
      child: SomethingWrong(),
    );
  }
}
