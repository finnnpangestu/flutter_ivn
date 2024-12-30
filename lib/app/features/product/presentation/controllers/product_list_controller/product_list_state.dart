import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(Status<List<Product>>.initial()) Status<List<Product>> productsStatus,
  }) = _ProductListState;
}
