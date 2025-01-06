import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_event.freezed.dart';

@freezed
class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.getProducts({required Pagination pagination}) = GetProductsEvent;
}
