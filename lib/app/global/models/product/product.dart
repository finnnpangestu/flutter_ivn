import 'package:flutter_ivn/app/global/models/dimension/dimension.dart';
import 'package:flutter_ivn/app/global/models/meta/meta.dart';
import 'package:flutter_ivn/app/global/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? description,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? category,
    String? brand,
    String? sku,
    double? weight,
    Dimension? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    String? thumbnail,
    List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
