// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DimensionImpl _$$DimensionImplFromJson(Map<String, dynamic> json) =>
    _$DimensionImpl(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DimensionImplToJson(_$DimensionImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
