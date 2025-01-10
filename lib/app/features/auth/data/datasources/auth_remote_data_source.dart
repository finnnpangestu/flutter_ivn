import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/core/utils/token_storage.dart';
import 'package:flutter_ivn/app/global/models/token/token.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> postUserLogin({required String username, required String password});
  Future<User> getUser();
  Future<Token> postRefreshToken();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final APIClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<User> postUserLogin({required String username, required String password}) async {
    try {
      final response = await apiClient.post(
        "/auth/login",
        body: {
          "username": username,
          "password": password,
          "expiresInMins": 30,
        },
        credentials: "include",
      );

      if (response == null || response['accessToken'] == null) {
        throw ServerException(message: "Invalid response");
      }

      return User.fromJson(response);
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }

  @override
  Future<User> getUser() async {
    try {
      final response = await apiClient.get("/auth/me",
          headers: {
            'Authorization': 'Bearer ${getAccessToken()}',
          },
          credentials: "include");

      return User.fromJson(response);
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }

  @override
  Future<Token> postRefreshToken() async {
    try {
      final response = await apiClient.post("/auth/refresh",
          body: {
            "refreshToken": getAccessToken(),
            "expiresInMins": 30,
          },
          credentials: "include");

      if (response == null || response['accessToken'] == null) {
        throw ServerException(message: "Invalid response");
      }

      return Token.fromJson(response);
    } on Exception {
      throw ServerException(message: "Failed to load data");
    }
  }
}
