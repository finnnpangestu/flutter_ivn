import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_product.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final useCaseGetProducts = sl<GetProduct>();

  ProductDetailBloc() : super(const ProductDetailState()) {
    on<GetProductDetailEvent>(_onGetProductDetail);
  }

  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) return "Server Error: ${failure.message}";
    if (failure is NetworkFailure) return "Network Error: ${failure.message}";
    return "Unexpected Error: ${failure.message}";
  }

  Future<void> _onGetProductDetail(GetProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(productDetailStatus: Status.loading()));
    final result = await useCaseGetProducts(event.id);

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
