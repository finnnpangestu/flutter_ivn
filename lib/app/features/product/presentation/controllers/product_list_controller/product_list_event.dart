import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_event.freezed.dart';

@freezed
class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.getProducts() = GetProductsEvent;
  const factory ProductListEvent.getProductDetail(String id) = GetProductDetailEvent;
}
