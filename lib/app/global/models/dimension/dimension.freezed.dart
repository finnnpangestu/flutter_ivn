// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dimension.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dimension _$DimensionFromJson(Map<String, dynamic> json) {
  return _Dimension.fromJson(json);
}

/// @nodoc
mixin _$Dimension {
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get depth => throw _privateConstructorUsedError;

  /// Serializes this Dimension to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dimension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DimensionCopyWith<Dimension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionCopyWith<$Res> {
  factory $DimensionCopyWith(Dimension value, $Res Function(Dimension) then) =
      _$DimensionCopyWithImpl<$Res, Dimension>;
  @useResult
  $Res call({double? width, double? height, double? depth});
}

/// @nodoc
class _$DimensionCopyWithImpl<$Res, $Val extends Dimension>
    implements $DimensionCopyWith<$Res> {
  _$DimensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dimension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? depth = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimensionImplCopyWith<$Res>
    implements $DimensionCopyWith<$Res> {
  factory _$$DimensionImplCopyWith(
          _$DimensionImpl value, $Res Function(_$DimensionImpl) then) =
      __$$DimensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? width, double? height, double? depth});
}

/// @nodoc
class __$$DimensionImplCopyWithImpl<$Res>
    extends _$DimensionCopyWithImpl<$Res, _$DimensionImpl>
    implements _$$DimensionImplCopyWith<$Res> {
  __$$DimensionImplCopyWithImpl(
      _$DimensionImpl _value, $Res Function(_$DimensionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dimension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? depth = freezed,
  }) {
    return _then(_$DimensionImpl(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DimensionImpl implements _Dimension {
  const _$DimensionImpl({this.width, this.height, this.depth});

  factory _$DimensionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DimensionImplFromJson(json);

  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? depth;

  @override
  String toString() {
    return 'Dimension(width: $width, height: $height, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimensionImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, depth);

  /// Create a copy of Dimension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DimensionImplCopyWith<_$DimensionImpl> get copyWith =>
      __$$DimensionImplCopyWithImpl<_$DimensionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DimensionImplToJson(
      this,
    );
  }
}

abstract class _Dimension implements Dimension {
  const factory _Dimension(
      {final double? width,
      final double? height,
      final double? depth}) = _$DimensionImpl;

  factory _Dimension.fromJson(Map<String, dynamic> json) =
      _$DimensionImpl.fromJson;

  @override
  double? get width;
  @override
  double? get height;
  @override
  double? get depth;

  /// Create a copy of Dimension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DimensionImplCopyWith<_$DimensionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
