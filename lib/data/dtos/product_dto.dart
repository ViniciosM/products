import 'dart:convert';
import 'dart:developer';

import 'package:products/data/dtos/rating_dto.dart';
import 'package:products/domain/entities/product_entity.dart';

class ProductDTO {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingDTO rating;

  ProductDTO({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  ProductDTO copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingDTO? rating,
  }) =>
      ProductDTO(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingDTO.fromJson(json["rating"]),
      );

  static List<ProductDTO> listFromJson(List jsonList) {
    // List<ProductDTO> products =
    //     (json as List).map((product) => ProductDTO.fromJson(product)).toList();
    List<ProductDTO> products =
        jsonList.map((product) => ProductDTO.fromJson(product)).toList();
    return products;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };

  static List<ProductEntity> toEntityFromList(List<ProductDTO> products) {
    return products.map((p) => p.toEntity()).toList();
  }

  factory ProductDTO.fromEntity(ProductEntity productEntity) {
    return ProductDTO(
        id: productEntity.id,
        title: productEntity.title,
        price: productEntity.price,
        description: productEntity.description,
        category: productEntity.category,
        image: productEntity.image,
        rating: RatingDTO.fromEntity(productEntity.rating));
  }

  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: RatingDTO.toEntity(rating));
  }
}
