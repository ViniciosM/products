import 'package:flutter_test/flutter_test.dart';
import 'package:products/data/dtos/product_dto.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/entities/rating_entity.dart';

void main() {
  late ProductDTO productDTO;
  late ProductEntity productEntity;
  late RatingEntity ratingEntity;
  setUpAll(() {
    ratingEntity = RatingEntity(count: 10, rate: 4.5);

    productEntity = ProductEntity(
      id: 1,
      title: 'Product X',
      price: 50.0,
      description: 'Description X',
      category: 'X',
      image: 'www.someurl.com/x.png',
      rating: ratingEntity,
    );

    productDTO = ProductDTO.fromMap(const {
      'id': 123,
      'title': 'Mens Casual Slim Fit',
      'price': 19.99,
      'category': 'clothes',
      'description': 'nice and comfortable',
      'image': 'image.png',
      'rating': {
        'count': 10,
        'rate': 4.5,
      },
    });
  });
  group('[DATA] - ProductDTO', () {
    test('should get values from map', () {
      expect(productDTO.title, 'Mens Casual Slim Fit');
      expect(productDTO.category, 'clothes');
      expect(productDTO.description, 'nice and comfortable');
      expect(productDTO.price, 19.99);
      expect(productDTO.image, 'image.png');
      expect(productDTO.rating.rate, 4.5);
      expect(productDTO.rating.count, 10);
    });

    test('should convert entity to dto', () {
      var productDTOFromEntity = ProductDTO.entityToDTO(productDTO);
      expect(productDTOFromEntity.title, 'Mens Casual Slim Fit');
      expect(productDTOFromEntity.category, 'clothes');
      expect(productDTOFromEntity.description, 'nice and comfortable');
      expect(productDTOFromEntity.price, 19.99);
      expect(productDTOFromEntity.image, 'image.png');
      expect(productDTOFromEntity.rating.rate, 4.5);
      expect(productDTOFromEntity.rating.count, 10);
    });

    test('should convert dto to entity', () {
      var productEntityFromDTO = ProductDTO.fromEntity(productEntity);
      expect(productEntityFromDTO.title, 'Product X');
      expect(productEntityFromDTO.category, 'X');
      expect(productEntityFromDTO.description, 'Description X');
      expect(productEntityFromDTO.price, 50.00);
      expect(productEntityFromDTO.image, 'www.someurl.com/x.png');
      expect(productEntityFromDTO.rating.rate, 4.5);
      expect(productEntityFromDTO.rating.count, 10);
    });

    test('should return a product dto from json', () {
      var productDTOFromJson = ProductDTO.fromJson(productDTO.toJson());
      expect(productDTOFromJson.id, 123);
      expect(productDTOFromJson.title, 'Mens Casual Slim Fit');
      expect(productDTOFromJson.category, 'clothes');
      expect(productDTOFromJson.description, 'nice and comfortable');
      expect(productDTOFromJson.price, 19.99);
      expect(productDTOFromJson.image, 'image.png');
      expect(productDTOFromJson.rating.rate, 4.5);
      expect(productDTOFromJson.rating.count, 10);
    });
  });
}
