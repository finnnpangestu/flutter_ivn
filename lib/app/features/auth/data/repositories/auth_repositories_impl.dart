import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ivn/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ivn/app/global/models/token/token.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, User>> postUserLogin({required String username, required String password}) async {
    try {
      final user = await remoteDataSource.postUserLogin(username: username, password: password);
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } catch (error) {
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failures, User>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } catch (error) {
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failures, Token>> postRefreshToken() async {
    try {
      final token = await remoteDataSource.postRefreshToken();
      return Right(token);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } catch (error) {
      return Left(UnknownFailure(error.toString()));
    }
  }
}
