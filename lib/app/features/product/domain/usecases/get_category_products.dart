import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/global/models/category_product/category_product.dart';

class GetCategoryProducts {
  final ProductRepository repository;

  GetCategoryProducts(this.repository);

  Future<Either<Failures, List<CategoryProduct>>> call() async {
    return await repository.fetchCategoryProducts();
  }
}
