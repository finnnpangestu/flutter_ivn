import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimension.freezed.dart';
part 'dimension.g.dart';

@freezed
class Dimension with _$Dimension {
  const factory Dimension({
    double? width,
    double? height,
    double? depth,
  }) = _Dimension;

  factory Dimension.fromJson(Map<String, dynamic> json) => _$DimensionFromJson(json);
}
