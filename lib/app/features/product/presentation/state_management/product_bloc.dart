import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_product.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_products.dart';
import 'package:flutter_ivn/app/features/product/presentation/state_management/product_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/state_management/product_state.dart';
import 'package:flutter_ivn/app/global/state/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final useCaseGetProducts = sl<GetProducts>();
  final useCaseGetProduct = sl<GetProduct>();

  ProductBloc() : super(const ProductState()) {
    on<GetProductsEvent>(_onGetProducts);
    on<GetProductDetailEvent>(_onGetProductDetail);
  }

  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) return "Server Error: ${failure.message}";
    if (failure is NetworkFailure) return "Network Error: ${failure.message}";
    return "Unexpected Error: ${failure.message}";
  }

  Future<void> _onGetProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productsStatus: Status.loading()));
    final result = await useCaseGetProducts();

    result.fold(
      (failure) {
        emit(state.copyWith(productsStatus: Status.error(message: _mapFailureToMessage(failure))));
      },
      (data) {
        emit(state.copyWith(productsStatus: Status.loaded(data: data)));
      },
    );
  }

  Future<void> _onGetProductDetail(GetProductDetailEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productDetailStatus: Status.loading()));
    final result = await useCaseGetProduct(event.id);

    result.fold(
      (failure) {
        emit(state.copyWith(productDetailStatus: Status.error(message: _mapFailureToMessage(failure))));
      },
      (data) {
        emit(state.copyWith(productDetailStatus: Status.loaded(data: data)));
      },
    );
  }
}
