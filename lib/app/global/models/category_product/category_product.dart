import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_product.freezed.dart';
part 'category_product.g.dart';

@freezed
class CategoryProduct with _$CategoryProduct {
  const factory CategoryProduct({
    String? slug,
    String? name,
    String? url,
  }) = _CategoryProduct;

  factory CategoryProduct.fromJson(Map<String, dynamic> json) => _$CategoryProductFromJson(json);
}
