import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';

abstract class ProductRepository {
  Future<Either<Failures, List<Product>>> fetchProducts();
  Future<Either<Failures, Product>> fetchProductDetails(String id);
}
