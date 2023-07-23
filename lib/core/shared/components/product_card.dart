import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/core/shared/components/rating_product.dart';
import 'package:products/core/theme/consts/p_colors.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_label.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/presentation/favorites/controllers/favorites_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductDTO product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PColors.white,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: PSizes.size12,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PLabel(
                  text: product.title,
                  maxLines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingProduct(
                      rating: product.rating,
                    ),
                    IconButton(
                        onPressed: () async {
                          await Modular.get<FavoritesController>()
                              .addToFavorites(productDTO: product);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                  ],
                ),
                PLabel(
                  text: '\$${product.price}',
                  fontSize: 18,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
