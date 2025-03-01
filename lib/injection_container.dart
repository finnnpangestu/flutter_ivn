import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ivn/app/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:flutter_ivn/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ivn/app/features/auth/domain/usecases/get_user.dart';
import 'package:flutter_ivn/app/features/auth/domain/usecases/post_auth_login.dart';
import 'package:flutter_ivn/app/features/auth/domain/usecases/post_refresh_token.dart';
import 'package:flutter_ivn/app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_ivn/app/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_ivn/app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_category_products.dart';
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
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(apiClient: sl()));

  /* Repositories */
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoriesImpl(remoteDataSource: sl()));

  /* Use Case */
  sl.registerLazySingleton(() => UseCaseGetProducts(sl()));
  sl.registerLazySingleton(() => UseCaseGetProduct(sl()));
  sl.registerLazySingleton(() => UseCaseGetCategoryProducts(sl()));
  sl.registerLazySingleton(() => UseCasePostAuthLogin(sl()));
  sl.registerLazySingleton(() => UseCaseGetUser(sl()));
  sl.registerLazySingleton(() => UseCasePostRefrestToken(sl()));
}
