import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/main/presentation/controllers/main_state.dart';
import 'package:flutter_ivn/app/router/app_router.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void onTabTapped(int index, BuildContext context) {
    emit(state.copyWith(currentIndex: index));

    switch (index) {
      case 0:
        context.router.replace(DashboardRoute());
        break;
      case 1:
        context.router.replace(ProductListRoute());
        break;
      case 2:
        context.router.replace(CartRoute());
        break;
      case 3:
        // context.router.push(ProductListRoute());
        break;
    }
  }
}
