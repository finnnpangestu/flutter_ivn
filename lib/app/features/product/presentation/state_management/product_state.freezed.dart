// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  Status<List<Product>> get productsStatus =>
      throw _privateConstructorUsedError;
  Status<Product> get productDetailStatus => throw _privateConstructorUsedError;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {Status<List<Product>> productsStatus,
      Status<Product> productDetailStatus});

  $StatusCopyWith<List<Product>, $Res> get productsStatus;
  $StatusCopyWith<Product, $Res> get productDetailStatus;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsStatus = null,
    Object? productDetailStatus = null,
  }) {
    return _then(_value.copyWith(
      productsStatus: null == productsStatus
          ? _value.productsStatus
          : productsStatus // ignore: cast_nullable_to_non_nullable
              as Status<List<Product>>,
      productDetailStatus: null == productDetailStatus
          ? _value.productDetailStatus
          : productDetailStatus // ignore: cast_nullable_to_non_nullable
              as Status<Product>,
    ) as $Val);
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<List<Product>, $Res> get productsStatus {
    return $StatusCopyWith<List<Product>, $Res>(_value.productsStatus, (value) {
      return _then(_value.copyWith(productsStatus: value) as $Val);
    });
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<Product, $Res> get productDetailStatus {
    return $StatusCopyWith<Product, $Res>(_value.productDetailStatus, (value) {
      return _then(_value.copyWith(productDetailStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
          _$ProductStateImpl value, $Res Function(_$ProductStateImpl) then) =
      __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status<List<Product>> productsStatus,
      Status<Product> productDetailStatus});

  @override
  $StatusCopyWith<List<Product>, $Res> get productsStatus;
  @override
  $StatusCopyWith<Product, $Res> get productDetailStatus;
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl _value, $Res Function(_$ProductStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsStatus = null,
    Object? productDetailStatus = null,
  }) {
    return _then(_$ProductStateImpl(
      productsStatus: null == productsStatus
          ? _value.productsStatus
          : productsStatus // ignore: cast_nullable_to_non_nullable
              as Status<List<Product>>,
      productDetailStatus: null == productDetailStatus
          ? _value.productDetailStatus
          : productDetailStatus // ignore: cast_nullable_to_non_nullable
              as Status<Product>,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl implements _ProductState {
  const _$ProductStateImpl(
      {this.productsStatus = const Status<List<Product>>.initial(),
      this.productDetailStatus = const Status<Product>.initial()});

  @override
  @JsonKey()
  final Status<List<Product>> productsStatus;
  @override
  @JsonKey()
  final Status<Product> productDetailStatus;

  @override
  String toString() {
    return 'ProductState(productsStatus: $productsStatus, productDetailStatus: $productDetailStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.productsStatus, productsStatus) ||
                other.productsStatus == productsStatus) &&
            (identical(other.productDetailStatus, productDetailStatus) ||
                other.productDetailStatus == productDetailStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productsStatus, productDetailStatus);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState implements ProductState {
  const factory _ProductState(
      {final Status<List<Product>> productsStatus,
      final Status<Product> productDetailStatus}) = _$ProductStateImpl;

  @override
  Status<List<Product>> get productsStatus;
  @override
  Status<Product> get productDetailStatus;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
