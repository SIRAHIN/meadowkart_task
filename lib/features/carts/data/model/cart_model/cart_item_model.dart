import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';


part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
@HiveType(typeId: 2)
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @HiveField(0) required ProductEntity product,
    @HiveField(1) required int quantity,
  }) = _CartItemModel;

  double get totalPrice => product.price * quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}