import 'dart:convert';

import 'package:flutter_ivn/app/core/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIClient {
  final http.Client httpClient;

  APIClient({required this.httpClient});

  Future<dynamic> get(String url) async {
    final response = await httpClient.get(Uri.parse('${Constants.baseDummyUrl}$url'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final response = await httpClient.post(
      Uri.parse('${Constants.baseDummyUrl}$url'),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    final response = await httpClient.put(
      Uri.parse('${Constants.baseDummyUrl}$url'),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<dynamic> delete(String url) async {
    final response = await httpClient.delete(Uri.parse('${Constants.baseDummyUrl}$url'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }
}
