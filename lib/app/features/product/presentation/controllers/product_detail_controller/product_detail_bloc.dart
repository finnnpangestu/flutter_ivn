import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_product.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final useCaseGetProducts = sl<GetProduct>();

  ProductDetailCubit() : super(const ProductDetailState());

  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) return "Server Error: ${failure.message}";
    if (failure is NetworkFailure) return "Network Error: ${failure.message}";
    return "Unexpected Error: ${failure.message}";
  }

  Future<void> onGetProductDetail(String id) async {
    emit(state.copyWith(status: Status.loading()));

    final result = await useCaseGetProducts(id);

    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.error(exception: Exception(failure.toString()), message: _mapFailureToMessage(failure))));
      },
      (data) {
        emit(state.copyWith(status: Status.success(), product: data));
      },
    );
  }
}
