import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';

class UseCasePostAuthLogin {
  final AuthRepository repository;

  UseCasePostAuthLogin(this.repository);

  Future<Either<Failures, User>> call({required String username, required String password}) async {
    return await repository.postUserLogin(username: username, password: password);
  }
}
