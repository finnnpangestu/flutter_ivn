import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts({Pagination? pagination});
  Future<Product> getProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final APIClient apiClient;

  ProductRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Product> getProduct(String id) async {
    try {
      final response = await apiClient.get("/products/$id");

      return Product.fromJson(response);
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }

  @override
  Future<List<Product>> getProducts({Pagination? pagination}) async {
    try {
      final response = await apiClient.get("/products", queryParams: pagination?.toJson());
      final List<dynamic> data = response['products'];

      return data.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }
}
