import 'dart:convert';

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

  ProductDTO.fromMap(Map map)
      : id = map['id'],
        title = map['title'],
        price = map['price'],
        description = map['description'],
        category = map['category'],
        image = map['image'],
        rating = RatingDTO.fromJson(map['rating']);

  factory ProductDTO.stringToObject(String source) =>
      ProductDTO.fromJson(jsonDecode(source));

  static List<ProductDTO> responseToListObject(List jsonList) {
    return jsonList.map((product) => ProductDTO.fromJson(product)).toList();
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

  static ProductEntity entityToDTO(ProductDTO productDTO) {
    return ProductEntity(
        id: productDTO.id,
        title: productDTO.title,
        price: productDTO.price,
        description: productDTO.description,
        category: productDTO.category,
        image: productDTO.image,
        rating: RatingDTO.toEntity(productDTO.rating));
  }

  static ProductDTO decodeProductFromJson(String stringProduct) {
    final Map<String, dynamic> productMap = jsonDecode(stringProduct);
    final RatingDTO rating = RatingDTO(
      rate: productMap['rating']['rate'],
      count: productMap['rating']['count'],
    );

    return ProductDTO(
      id: productMap['id'],
      title: productMap['title'],
      price: productMap['price'],
      description: productMap['description'],
      category: productMap['category'],
      image: productMap['image'],
      rating: rating,
    );
  }

  static ProductDTO fromString(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return ProductDTO(
      id: data['id'],
      title: data['title'],
      price: data['price'].toDouble(),
      description: data['description'],
      category: data['category'],
      image: data['image'],
      rating: RatingDTO(
        rate: data['rating']['rate'].toDouble(),
        count: data['rating']['count'],
      ),
    );
  }
}
