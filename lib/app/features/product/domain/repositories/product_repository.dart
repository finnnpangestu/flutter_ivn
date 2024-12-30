import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';

abstract class ProductRepository {
  Future<Either<Failures, List<Product>>> fetchProducts({Pagination? pagination});
  Future<Either<Failures, Product>> fetchProductDetails(String id);
}
