import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(Status<List<Product>>.initial()) Status<List<Product>> productsStatus,
    @Default(Status<Product>.initial()) Status<Product> productDetailStatus,
  }) = _ProductState;
}
