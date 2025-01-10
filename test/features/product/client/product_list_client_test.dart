import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAPIClient extends Mock implements APIClient {}

void main() {
  late MockAPIClient mockApiClient;
  late ProductRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockAPIClient();
    dataSource = ProductRemoteDataSourceImpl(apiClient: mockApiClient);
  });

  group('getProducts', () {
    final pagination = Pagination(limit: 10, currentPage: 0);

    test('when status code is 200, return List<Product>', () async {
      final productsJson = {
        "products": [
          {"id": 1, "title": "Product 1"},
          {"id": 2, "title": "Product 2"},
        ]
      };
      when(() => mockApiClient.get(any(), queryParams: any(named: 'queryParams'))).thenAnswer((_) async => productsJson);

      final result = await dataSource.getProducts(pagination: pagination);

      expect(result, isA<List<Product>>());
      expect(result.length, 2);
      expect(result[0].title, "Product 1");
    });

    test('when status code is 400, throw ServerException', () async {
      when(() => mockApiClient.get(any(), queryParams: any(named: 'queryParams'))).thenThrow(ServerException(message: "Bad Request"));

      expect(() => dataSource.getProducts(pagination: pagination), throwsA(isA<ServerException>()));
    });

    test('when status code is 404, throw ServerException', () async {
      when(() => mockApiClient.get(any(), queryParams: any(named: 'queryParams'))).thenThrow(ServerException(message: "Not Found"));

      expect(() => dataSource.getProducts(pagination: pagination), throwsA(isA<ServerException>()));
    });

    test('when status code is 500, throw ServerException', () async {
      when(() => mockApiClient.get(any(), queryParams: any(named: 'queryParams'))).thenThrow(ServerException(message: "Internal Server Error"));

      expect(() => dataSource.getProducts(pagination: pagination), throwsA(isA<ServerException>()));
    });
  });
}
