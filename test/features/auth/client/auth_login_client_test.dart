import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/network/api_client.dart';
import 'package:flutter_ivn/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ivn/app/global/models/user/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAPIClient extends Mock implements APIClient {}

void main() {
  late MockAPIClient mockAPIClient;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockAPIClient = MockAPIClient();
    dataSource = AuthRemoteDataSourceImpl(apiClient: mockAPIClient);
  });

  group('postUserLogin', () {
    final username = "emilys";
    final password = "emilyspass";
    final mockResponse = {
      "id": 1,
      "username": username,
      "email": "emily@example.com",
      "firstName": "Emily",
      "lastName": "Doe",
      "gender": "female",
      "image": "https://example.com/emily.jpg",
      "accessToken": "mockAccessToken",
      "refreshToken": "mockRefreshToken",
    };

    test('when status code is 200, return User', () async {
      when(() => mockAPIClient.post(any(), body: any(named: 'body'), credentials: any(named: 'credentials'))).thenAnswer((_) async => mockResponse);

      final result = await dataSource.postUserLogin(username: username, password: password);

      expect(result, isA<User>());
      expect(result.username, mockResponse['username']);
      expect(result.accessToken, mockResponse['accessToken']);
    });

    test('when status code is 400, throw ServerException', () async {
      when(() => mockAPIClient.post(any(), body: any(named: 'body'), credentials: any(named: 'credentials')))
          .thenThrow(ServerException(message: "Bad Request"));

      expect(() => dataSource.postUserLogin(username: username, password: password), throwsA(isA<ServerException>()));
    });

    test('when status code is 404, throw ServerException', () async {
      when(() => mockAPIClient.post(any(), body: any(named: 'body'), credentials: any(named: 'credentials'))).thenThrow(ServerException(message: "Not Found"));

      expect(
        () => dataSource.postUserLogin(username: username, password: password),
        throwsA(isA<ServerException>()),
      );
    });

    test('when status code is 500, throw ServerException', () async {
      when(() => mockAPIClient.post(any(), body: any(named: 'body'), credentials: any(named: 'credentials')))
          .thenThrow(ServerException(message: "Internal Server Error"));

      expect(
        () => dataSource.postUserLogin(username: username, password: password),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
