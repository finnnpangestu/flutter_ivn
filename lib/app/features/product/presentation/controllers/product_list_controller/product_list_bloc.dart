import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_products.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/dialog/product_filter_dialog.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/injection_container.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final useCaseGetProducts = sl<GetProducts>();

  ProductListBloc() : super(const ProductListState()) {
    on<GetProductsEvent>(onGetProducts);
  }

  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) return "Server Error: ${failure.message}";
    if (failure is NetworkFailure) return "Network Error: ${failure.message}";
    return "Unexpected Error: ${failure.message}";
  }

  Future<void> onGetProducts(GetProductsEvent event, Emitter<ProductListState> emit) async {
    if (event.pagination.currentPage > 0) {
      emit(state.copyWith(status: Status.loadingMore()));
    } else {
      emit(state.copyWith(status: Status.loading()));
    }

    final result = await useCaseGetProducts(pagination: event.pagination, searchValue: event.searchValue);

    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.error(exception: Exception(failure.toString()), message: _mapFailureToMessage(failure))));
      },
      (data) {
        emit(state.copyWith(status: Status.success(), products: event.pagination.currentPage > 0 ? [...state.products, ...data] : data));
      },
    );
  }

  Future<void> onFilter(BuildContext context) async {
    final result = await ProductFilterDialog.start(context: context);

    if (result) {
      add(ProductListEvent.getProducts(pagination: Pagination().reset()));
    }
  }
}
