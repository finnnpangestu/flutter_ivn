import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_ivn/app/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_product.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_products.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  /* API Client */
  sl.registerLazySingleton(() => APIClient(httpClient: http.Client()));

  /* Data Source */
  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(apiClient: sl()));

  /* Repositories */
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: sl()));

  /* Use Case */
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
}
