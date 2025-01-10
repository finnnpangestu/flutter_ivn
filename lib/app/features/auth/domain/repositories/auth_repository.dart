import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/global/models/token/token.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';

abstract class AuthRepository {
  Future<Either<Failures, User>> postUserLogin({required String username, required String password});
  Future<Either<Failures, User>> getUser();
  Future<Either<Failures, Token>> postRefreshToken();
}
