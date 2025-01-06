import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, Product>> fetchProductDetails(String id) async {
    try {
      final product = await remoteDataSource.getProduct(id);
      return Right(product);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } catch (error) {
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failures, List<Product>>> fetchProducts({Pagination? pagination}) async {
    try {
      final products = await remoteDataSource.getProducts(pagination: pagination);
      return Right(products);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } catch (error) {
      return Left(UnknownFailure(error.toString()));
    }
  }
}
