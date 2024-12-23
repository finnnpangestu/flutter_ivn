import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(Status<Product>.initial()) Status<Product> productDetailStatus,
  }) = _ProductDetailState;
}
