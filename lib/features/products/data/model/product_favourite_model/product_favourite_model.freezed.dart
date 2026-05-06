// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_favourite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductFavouriteModel _$ProductFavouriteModelFromJson(
    Map<String, dynamic> json) {
  return _ProductFavouriteModel.fromJson(json);
}

/// @nodoc
mixin _$ProductFavouriteModel {
  @HiveField(0)
  int get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFavouriteModelCopyWith<ProductFavouriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFavouriteModelCopyWith<$Res> {
  factory $ProductFavouriteModelCopyWith(ProductFavouriteModel value,
          $Res Function(ProductFavouriteModel) then) =
      _$ProductFavouriteModelCopyWithImpl<$Res, ProductFavouriteModel>;
  @useResult
  $Res call({@HiveField(0) int productId});
}

/// @nodoc
class _$ProductFavouriteModelCopyWithImpl<$Res,
        $Val extends ProductFavouriteModel>
    implements $ProductFavouriteModelCopyWith<$Res> {
  _$ProductFavouriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFavouriteModelImplCopyWith<$Res>
    implements $ProductFavouriteModelCopyWith<$Res> {
  factory _$$ProductFavouriteModelImplCopyWith(
          _$ProductFavouriteModelImpl value,
          $Res Function(_$ProductFavouriteModelImpl) then) =
      __$$ProductFavouriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int productId});
}

/// @nodoc
class __$$ProductFavouriteModelImplCopyWithImpl<$Res>
    extends _$ProductFavouriteModelCopyWithImpl<$Res,
        _$ProductFavouriteModelImpl>
    implements _$$ProductFavouriteModelImplCopyWith<$Res> {
  __$$ProductFavouriteModelImplCopyWithImpl(_$ProductFavouriteModelImpl _value,
      $Res Function(_$ProductFavouriteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$ProductFavouriteModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFavouriteModelImpl implements _ProductFavouriteModel {
  const _$ProductFavouriteModelImpl({@HiveField(0) required this.productId});

  factory _$ProductFavouriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFavouriteModelImplFromJson(json);

  @override
  @HiveField(0)
  final int productId;

  @override
  String toString() {
    return 'ProductFavouriteModel(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFavouriteModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFavouriteModelImplCopyWith<_$ProductFavouriteModelImpl>
      get copyWith => __$$ProductFavouriteModelImplCopyWithImpl<
          _$ProductFavouriteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFavouriteModelImplToJson(
      this,
    );
  }
}

abstract class _ProductFavouriteModel implements ProductFavouriteModel {
  const factory _ProductFavouriteModel(
          {@HiveField(0) required final int productId}) =
      _$ProductFavouriteModelImpl;

  factory _ProductFavouriteModel.fromJson(Map<String, dynamic> json) =
      _$ProductFavouriteModelImpl.fromJson;

  @override
  @HiveField(0)
  int get productId;
  @override
  @JsonKey(ignore: true)
  _$$ProductFavouriteModelImplCopyWith<_$ProductFavouriteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
