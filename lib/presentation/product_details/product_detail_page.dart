import 'package:flutter/material.dart';
import 'package:products/core/theme/consts/p_sizes.dart';
import 'package:products/core/theme/widgets/p_label.dart';
import 'package:products/data/dtos/product_dto.dart';

import '../../core/shared/components/rating_product.dart';
import '../../core/theme/consts/p_colors.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final ProductDTO product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PLabel(
          text: 'Product Details',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.padding20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: PSizes.size10,
              ),
              Image.network(
                product.image,
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: PSizes.size20,
              ),
              PLabel(
                text: product.title,
                maxLines: 3,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: PSizes.size20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingProduct(
                    rating: product.rating,
                  ),
                  PLabel(
                    text: '\$${product.price}',
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              const SizedBox(
                height: PSizes.size20,
              ),
              _category(product.category),
              const SizedBox(
                height: PSizes.size20,
              ),
              _description(product.description),
            ],
          ),
        ),
      ),
    );
  }

  _category(String category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.bar_chart_sharp, color: PColors.darkColor),
        const SizedBox(
          width: PSizes.padding8,
        ),
        PLabel(
          text: category,
        ),
      ],
    );
  }

  _description(String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.abc_sharp, color: PColors.darkColor),
        const SizedBox(
          width: PSizes.padding8,
        ),
        Expanded(
          child: PLabel(
            text: description,
            maxLines: 15,
            textOverflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
