// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProducts,
    required TResult Function(String id) getProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function(String id)? getProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
    TResult Function(String id)? getProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsEvent value) getProducts,
    required TResult Function(GetProductDetailEvent value) getProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsEvent value)? getProducts,
    TResult? Function(GetProductDetailEvent value)? getProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsEvent value)? getProducts,
    TResult Function(GetProductDetailEvent value)? getProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetProductsEventImplCopyWith<$Res> {
  factory _$$GetProductsEventImplCopyWith(_$GetProductsEventImpl value,
          $Res Function(_$GetProductsEventImpl) then) =
      __$$GetProductsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductsEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$GetProductsEventImpl>
    implements _$$GetProductsEventImplCopyWith<$Res> {
  __$$GetProductsEventImplCopyWithImpl(_$GetProductsEventImpl _value,
      $Res Function(_$GetProductsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProductsEventImpl implements GetProductsEvent {
  const _$GetProductsEventImpl();

  @override
  String toString() {
    return 'ProductEvent.getProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProductsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProducts,
    required TResult Function(String id) getProductDetail,
  }) {
    return getProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function(String id)? getProductDetail,
  }) {
    return getProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
    TResult Function(String id)? getProductDetail,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsEvent value) getProducts,
    required TResult Function(GetProductDetailEvent value) getProductDetail,
  }) {
    return getProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsEvent value)? getProducts,
    TResult? Function(GetProductDetailEvent value)? getProductDetail,
  }) {
    return getProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsEvent value)? getProducts,
    TResult Function(GetProductDetailEvent value)? getProductDetail,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(this);
    }
    return orElse();
  }
}

abstract class GetProductsEvent implements ProductEvent {
  const factory GetProductsEvent() = _$GetProductsEventImpl;
}

/// @nodoc
abstract class _$$GetProductDetailEventImplCopyWith<$Res> {
  factory _$$GetProductDetailEventImplCopyWith(
          _$GetProductDetailEventImpl value,
          $Res Function(_$GetProductDetailEventImpl) then) =
      __$$GetProductDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetProductDetailEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$GetProductDetailEventImpl>
    implements _$$GetProductDetailEventImplCopyWith<$Res> {
  __$$GetProductDetailEventImplCopyWithImpl(_$GetProductDetailEventImpl _value,
      $Res Function(_$GetProductDetailEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetProductDetailEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductDetailEventImpl implements GetProductDetailEvent {
  const _$GetProductDetailEventImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ProductEvent.getProductDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductDetailEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductDetailEventImplCopyWith<_$GetProductDetailEventImpl>
      get copyWith => __$$GetProductDetailEventImplCopyWithImpl<
          _$GetProductDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProducts,
    required TResult Function(String id) getProductDetail,
  }) {
    return getProductDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function(String id)? getProductDetail,
  }) {
    return getProductDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
    TResult Function(String id)? getProductDetail,
    required TResult orElse(),
  }) {
    if (getProductDetail != null) {
      return getProductDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsEvent value) getProducts,
    required TResult Function(GetProductDetailEvent value) getProductDetail,
  }) {
    return getProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsEvent value)? getProducts,
    TResult? Function(GetProductDetailEvent value)? getProductDetail,
  }) {
    return getProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsEvent value)? getProducts,
    TResult Function(GetProductDetailEvent value)? getProductDetail,
    required TResult orElse(),
  }) {
    if (getProductDetail != null) {
      return getProductDetail(this);
    }
    return orElse();
  }
}

abstract class GetProductDetailEvent implements ProductEvent {
  const factory GetProductDetailEvent(final String id) =
      _$GetProductDetailEventImpl;

  String get id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductDetailEventImplCopyWith<_$GetProductDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
