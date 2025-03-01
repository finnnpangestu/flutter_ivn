import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';

class UseCaseGetProducts {
  final ProductRepository repository;

  UseCaseGetProducts(this.repository);

  Future<Either<Failures, List<Product>>> call({Pagination? pagination, String? searchValue}) async {
    return await repository.fetchProducts(pagination: pagination, searchValue: searchValue);
  }
}
