import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_product.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final useCaseGetProducts = sl<GetProduct>();

  ProductDetailCubit() : super(const ProductDetailState());

  Future<void> onGetProductDetail(String id) async {
    try {
      emit(state.copyWith(status: Status.loading()));

      final result = await useCaseGetProducts(id);

      result.fold(
        (failure) {
          emit(state.copyWith(status: Status.error(message: failure.toString()), product: null));
        },
        (data) {
          emit(state.copyWith(status: Status.success(), product: data));
        },
      );
    } catch (error) {
      emit(state.copyWith(status: Status.error(message: error.toString()), product: null));
    }
  }
}
