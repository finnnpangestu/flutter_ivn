import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';

class UseCaseGetUser {
  final AuthRepository repository;

  UseCaseGetUser(this.repository);

  Future<Either<Failures, User>> call() async {
    return await repository.getUser();
  }
}
