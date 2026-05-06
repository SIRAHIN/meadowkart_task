// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductFavouriteModelAdapter extends TypeAdapter<ProductFavouriteModel> {
  @override
  final int typeId = 1;

  @override
  ProductFavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductFavouriteModel(
      productId: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductFavouriteModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFavouriteModelImpl _$$ProductFavouriteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductFavouriteModelImpl(
      productId: (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductFavouriteModelImplToJson(
        _$ProductFavouriteModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
    };
