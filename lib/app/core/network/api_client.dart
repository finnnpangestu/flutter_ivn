import 'dart:convert';

import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/utils/constants.dart';
import 'package:flutter_ivn/app/core/utils/token_storage.dart';
import 'package:http/http.dart' as http;

class APIClient {
  final http.Client httpClient;

  APIClient({required this.httpClient});

  Future<dynamic> _request(
    String url,
    String method, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    String? credentials,
  }) async {
    final uri = queryParameters != null && queryParameters.isNotEmpty
        ? Uri.parse('${Constants.baseDummyUrl}$url').replace(queryParameters: queryParameters.cast<String, dynamic>())
        : Uri.parse('${Constants.baseDummyUrl}$url');

    final requestHeaders = headers ?? {'Content-Type': 'application/json'};
    if (credentials != null) {
      requestHeaders['Authorization'] = 'Bearer ${getAccessToken()}';
    }

    final requestBody = body != null ? json.encode(body) : null;

    late final http.Response response;

    switch (method.toUpperCase()) {
      case 'GET':
        response = await httpClient.get(uri, headers: requestHeaders.cast<String, String>());
        break;
      case 'POST':
        response = await httpClient.post(uri, body: requestBody, headers: requestHeaders.cast<String, String>());
        break;
      case 'PUT':
        response = await httpClient.put(uri, body: requestBody, headers: requestHeaders.cast<String, String>());
        break;
      case 'DELETE':
        response = await httpClient.delete(uri, headers: requestHeaders.cast<String, String>());
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw ServerException(message: "Failed to load data: ${response.statusCode}, ${response.body}");
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? headers, Map<String, dynamic>? queryParams, String? credentials}) async {
    return await _request(url, 'GET', headers: headers, queryParameters: queryParams, credentials: credentials);
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? body, Map<String, String>? headers, String? credentials}) async {
    return await _request(url, 'POST', body: body, headers: headers, credentials: credentials);
  }

  Future<dynamic> put(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    return await _request(url, 'PUT', body: body, headers: headers);
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    return await _request(url, 'DELETE', headers: headers);
  }

  Future<dynamic> patch(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    return await _request(url, 'PATCH', body: body, headers: headers);
  }
}
