import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failures, Product>> call(String id) async {
    return await repository.fetchProductDetails(id);
  }
}
