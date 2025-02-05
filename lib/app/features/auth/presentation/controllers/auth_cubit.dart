import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/auth/domain/usecases/post_auth_login.dart';
import 'package:flutter_ivn/app/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/global/widgets/toast/g_toast.dart';
import 'package:flutter_ivn/app/router/app_router.dart';
import 'package:flutter_ivn/injection_container.dart';

class AuthCubit extends Cubit<AuthState> {
  final useCasePostAuth = sl<UseCasePostAuthLogin>();

  AuthCubit({UseCasePostAuthLogin? useCase}) : super(AuthState());

  Future<void> onLogin({required String username, required String password, required BuildContext context}) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        GToast.show(context: context, message: 'Username and Password are required', type: GToastType.success);
        return;
      }

      emit(state.copyWith(status: Status.loading()));

      final result = await useCasePostAuth(username: username, password: password);

      result.fold(
        (failure) {
          emit(state.copyWith(status: Status.error(message: failure.message)));
          GToast.show(context: context, message: failure.message);
        },
        (r) {
          emit(state.copyWith(status: Status.success()));
          context.router.replace(ProductListRoute());
          GToast.show(context: context, message: 'Login success', type: GToastType.success);
        },
      );
    } catch (error) {
      emit(state.copyWith(status: Status.error(message: error.toString())));
    }
  }
}
