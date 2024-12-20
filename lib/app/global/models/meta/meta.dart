import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
