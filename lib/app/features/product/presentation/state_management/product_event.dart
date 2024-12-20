import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProducts() = GetProductsEvent;
  const factory ProductEvent.getProductDetail(String id) = GetProductDetailEvent;
}
