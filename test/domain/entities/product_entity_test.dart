import 'package:flutter_test/flutter_test.dart';
import 'package:products/domain/entities/product_entity.dart';
import 'package:products/domain/entities/rating_entity.dart';

void main() {
  group('[DOMAIN] - ProductEntity', () {
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
    });
    test('variáveis', () async {
      expect(productEntity.id, 1);
      expect(productEntity.title, 'Product X');
      expect(productEntity.price, 50.0);
      expect(productEntity.description, 'Description X');
      expect(productEntity.image, 'www.someurl.com/x.png');
      expect(productEntity.rating, ratingEntity);
    });

    test('props', () async {
      expect(productEntity.props[0], 1);
      expect(productEntity.props[1], 'Product X');
      expect(productEntity.props[3], 'Description X');
    });
  });
}
