import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/auth/domain/usecases/post_auth_login.dart';
import 'package:flutter_ivn/app/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/router/app_router.dart';
import 'package:flutter_ivn/injection_container.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthCubit extends Cubit<AuthState> {
  final useCasePostAuth = sl<UseCasePostAuthLogin>();

  AuthCubit({UseCasePostAuthLogin? useCase}) : super(AuthState());

  Future<void> onLogin({required String username, required String password, required BuildContext context}) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username and Password are required', style: GoogleFonts.inter()),
            backgroundColor: Color(0xFF3D713C),
          ),
        );
        return;
      }

      emit(state.copyWith(status: Status.loading()));

      final result = await useCasePostAuth(username: username, password: password);

      result.fold(
        (failure) => emit(state.copyWith(status: Status.error(message: failure.message))),
        (r) {
          emit(state.copyWith(status: Status.success()));
          context.router.replace(ProductListRoute());
        },
      );
    } catch (error) {
      emit(state.copyWith(status: Status.error(message: error.toString())));
    }
  }
}
