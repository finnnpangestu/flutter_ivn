import 'dart:convert';

import 'package:flutter_ivn/app/core/utils/constants.dart';
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
  }) async {
    final uri = queryParameters != null && queryParameters.isNotEmpty
        ? Uri.parse('${Constants.baseDummyUrl}$url').replace(queryParameters: queryParameters.cast<String, String>())
        : Uri.parse('${Constants.baseDummyUrl}$url');

    final requestHeaders = headers ?? {'Content-Type': 'application/json'};
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

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? headers, Map<String, dynamic>? queryParams}) async {
    return await _request(url, 'GET', headers: headers, queryParameters: queryParams);
  }

  Future<dynamic> post(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    return await _request(url, 'POST', body: body, headers: headers);
  }

  Future<dynamic> put(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    return await _request(url, 'PUT', body: body, headers: headers);
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    return await _request(url, 'DELETE', headers: headers);
  }

  // Example of a method with flexible body and header
  Future<dynamic> patch(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    return await _request(url, 'PATCH', body: body, headers: headers);
  }
}
