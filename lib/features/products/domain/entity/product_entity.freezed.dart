// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return _ProductEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductEntity {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  double get price => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String get category => throw _privateConstructorUsedError;
  @HiveField(5)
  String get image => throw _privateConstructorUsedError;
  @HiveField(6)
  RatingEntity get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) then) =
      _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) double price,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) String image,
      @HiveField(6) RatingEntity rating});

  $RatingEntityCopyWith<$Res> get rating;
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatingEntityCopyWith<$Res> get rating {
    return $RatingEntityCopyWith<$Res>(_value.rating, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
          _$ProductEntityImpl value, $Res Function(_$ProductEntityImpl) then) =
      __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) double price,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) String image,
      @HiveField(6) RatingEntity rating});

  @override
  $RatingEntityCopyWith<$Res> get rating;
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
      _$ProductEntityImpl _value, $Res Function(_$ProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_$ProductEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductEntityImpl implements _ProductEntity {
  const _$ProductEntityImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.price,
      @HiveField(3) required this.description,
      @HiveField(4) required this.category,
      @HiveField(5) required this.image,
      @HiveField(6) required this.rating});

  factory _$ProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductEntityImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final double price;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final String category;
  @override
  @HiveField(5)
  final String image;
  @override
  @HiveField(6)
  final RatingEntity rating;

  @override
  String toString() {
    return 'ProductEntity(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, description, category, image, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductEntity implements ProductEntity {
  const factory _ProductEntity(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String title,
      @HiveField(2) required final double price,
      @HiveField(3) required final String description,
      @HiveField(4) required final String category,
      @HiveField(5) required final String image,
      @HiveField(6) required final RatingEntity rating}) = _$ProductEntityImpl;

  factory _ProductEntity.fromJson(Map<String, dynamic> json) =
      _$ProductEntityImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  double get price;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  String get category;
  @override
  @HiveField(5)
  String get image;
  @override
  @HiveField(6)
  RatingEntity get rating;
  @override
  @JsonKey(ignore: true)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingEntity _$RatingEntityFromJson(Map<String, dynamic> json) {
  return _RatingEntity.fromJson(json);
}

/// @nodoc
mixin _$RatingEntity {
  @HiveField(0)
  double get rate => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingEntityCopyWith<RatingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingEntityCopyWith<$Res> {
  factory $RatingEntityCopyWith(
          RatingEntity value, $Res Function(RatingEntity) then) =
      _$RatingEntityCopyWithImpl<$Res, RatingEntity>;
  @useResult
  $Res call({@HiveField(0) double rate, @HiveField(1) int count});
}

/// @nodoc
class _$RatingEntityCopyWithImpl<$Res, $Val extends RatingEntity>
    implements $RatingEntityCopyWith<$Res> {
  _$RatingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingEntityImplCopyWith<$Res>
    implements $RatingEntityCopyWith<$Res> {
  factory _$$RatingEntityImplCopyWith(
          _$RatingEntityImpl value, $Res Function(_$RatingEntityImpl) then) =
      __$$RatingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) double rate, @HiveField(1) int count});
}

/// @nodoc
class __$$RatingEntityImplCopyWithImpl<$Res>
    extends _$RatingEntityCopyWithImpl<$Res, _$RatingEntityImpl>
    implements _$$RatingEntityImplCopyWith<$Res> {
  __$$RatingEntityImplCopyWithImpl(
      _$RatingEntityImpl _value, $Res Function(_$RatingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_$RatingEntityImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingEntityImpl implements _RatingEntity {
  const _$RatingEntityImpl(
      {@HiveField(0) required this.rate, @HiveField(1) required this.count});

  factory _$RatingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingEntityImplFromJson(json);

  @override
  @HiveField(0)
  final double rate;
  @override
  @HiveField(1)
  final int count;

  @override
  String toString() {
    return 'RatingEntity(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingEntityImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingEntityImplCopyWith<_$RatingEntityImpl> get copyWith =>
      __$$RatingEntityImplCopyWithImpl<_$RatingEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingEntityImplToJson(
      this,
    );
  }
}

abstract class _RatingEntity implements RatingEntity {
  const factory _RatingEntity(
      {@HiveField(0) required final double rate,
      @HiveField(1) required final int count}) = _$RatingEntityImpl;

  factory _RatingEntity.fromJson(Map<String, dynamic> json) =
      _$RatingEntityImpl.fromJson;

  @override
  @HiveField(0)
  double get rate;
  @override
  @HiveField(1)
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$RatingEntityImplCopyWith<_$RatingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
