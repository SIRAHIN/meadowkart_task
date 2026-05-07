import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
@HiveType(typeId: 3)
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required double price,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required String image,
    @HiveField(6) required RatingEntity rating,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class RatingEntity with _$RatingEntity {
  const factory RatingEntity({
    @HiveField(0) required double rate,
    @HiveField(1) required int count,
  }) = _RatingEntity;

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);
}