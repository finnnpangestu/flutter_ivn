import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/global/models/category_product/category_product.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts({Pagination? pagination, String? searchValue});
  Future<Product> getProduct(String id);
  Future<List<CategoryProduct>> getCategoryProducts();
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
  Future<List<Product>> getProducts({Pagination? pagination, String? searchValue}) async {
    try {
      final response = await apiClient.get("/products${searchValue != null && searchValue.isNotEmpty ? "/search" : ""}", queryParams: {
        "skip": (pagination?.currentPage ?? 0).toString(),
        "limit": (pagination?.limit ?? 10).toString(),
        "q": searchValue,
      });
      final List<dynamic> data = response['products'];

      return data.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }

  @override
  Future<List<CategoryProduct>> getCategoryProducts() async {
    try {
      final response = await apiClient.get("/products/categories");

      final List<dynamic> data = response['categories'];

      return data.map((json) => CategoryProduct.fromJson(json as Map<String, dynamic>)).toList();
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }
}
