import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_products.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/dialog/product_filter_dialog.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final useCaseGetProducts = sl<UseCaseGetProducts>();

  ProductListCubit({UseCaseGetProducts? useCase}) : super(ProductListState());

  Future<void> getProducts(Pagination pagination, {String? searchValue}) async {
    try {
      emit(state.copyWith(status: Status.loading()));

      final result = await useCaseGetProducts(pagination: pagination, searchValue: searchValue);

      result.fold(
        (failure) {
          emit(state.copyWith(
            status: Status.error(message: failure.message),
            products: [],
          ));
        },
        (data) {
          emit(state.copyWith(
            status: Status.success(),
            products: pagination.currentPage > 0 ? [...state.products, ...data] : data,
          ));
        },
      );
    } catch (error) {
      emit(state.copyWith(status: Status.error(message: error.toString()), products: []));
    }
  }

  Future<void> filter(BuildContext context) async {
    final result = await ProductFilterDialog.start(context: context);

    if (result) {
      getProducts(Pagination().reset());
    }
  }

  void onCartProductChange({Product? product}) {
    emit(state.copyWith(carts: [...state.carts, product!]));
  }
}
