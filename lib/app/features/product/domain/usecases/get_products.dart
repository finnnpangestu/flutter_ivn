import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failures, List<Product>>> call() async {
    return await repository.fetchProducts();
  }
}
