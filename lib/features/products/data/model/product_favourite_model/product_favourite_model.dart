import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_favourite_model.freezed.dart';
part 'product_favourite_model.g.dart';

@freezed
@HiveType(typeId: 1)
class ProductFavouriteModel with _$ProductFavouriteModel {
  const factory ProductFavouriteModel({
    @HiveField(0) required int productId,
  }) = _ProductFavouriteModel;

  factory ProductFavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFavouriteModelFromJson(json);
}