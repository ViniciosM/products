import 'package:products/domain/entities/rating_entity.dart';

class RatingDTO {
  final double rate;
  final int count;

  RatingDTO({
    required this.rate,
    required this.count,
  });

  RatingDTO copyWith({
    double? rate,
    int? count,
  }) =>
      RatingDTO(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory RatingDTO.fromJson(Map<String, dynamic> json) => RatingDTO(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  static RatingEntity toEntity(RatingDTO ratingDTO) {
    return RatingEntity(rate: ratingDTO.rate, count: ratingDTO.count);
  }

  factory RatingDTO.fromEntity(RatingEntity ratingEntity) {
    return RatingDTO(rate: ratingEntity.rate, count: ratingEntity.count);
  }
}
