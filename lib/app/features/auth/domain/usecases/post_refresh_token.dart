import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ivn/app/global/models/token/token.dart';

class UseCasePostRefrestToken {
  final AuthRepository repository;

  UseCasePostRefrestToken(this.repository);

  Future<Either<Failures, Token>> call() async {
    return await repository.postRefreshToken();
  }
}
