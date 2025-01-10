import 'package:dartz/dartz.dart';
import 'package:flutter_ivn/app/core/error/exceptions.dart';
import 'package:flutter_ivn/app/core/error/failures.dart';
import 'package:flutter_ivn/app/features/product/domain/usecases/get_products.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProducts extends Mock implements GetProducts {}

void main() {
  late MockGetProducts mockGetProducts;
  late ProductListCubit cubit;

  setUp(() {
    mockGetProducts = MockGetProducts();
    cubit = ProductListCubit(useCase: mockGetProducts);
  });

  tearDown(() {
    cubit.close();
  });

  void setUpMockGetProducts(Either<Failures, List<Product>> result) {
    when(() => mockGetProducts(
          pagination: any(named: 'pagination'),
          searchValue: any(named: 'searchValue'),
        )).thenAnswer((_) async => result);
  }

  group('getProducts', () {
    final pagination = Pagination(limit: 10, currentPage: 0);
    final products = [
      Product(id: 1, title: 'Product 1'),
      Product(id: 2, title: 'Product 2'),
    ];

    test('emit loading and success fetching', () async {
      setUpMockGetProducts(Right(products));

      expectLater(
        cubit.stream,
        emitsInOrder([
          ProductListState(status: Status.loading(), products: []),
          ProductListState(status: Status.success(), products: products),
        ]),
      );

      await cubit.getProducts(pagination);

      verify(() => mockGetProducts(
            pagination: pagination,
            searchValue: any(named: 'searchValue'),
          )).called(1);
    });

    test('emit loading and fail fetching due to server error', () async {
      final failureMessage = ServerException(message: "Server error");
      setUpMockGetProducts(Left(ServerFailure(failureMessage.message)));

      expectLater(
        cubit.stream,
        emitsInOrder([
          ProductListState(status: Status.loading(), products: []),
          ProductListState(status: Status.error(message: failureMessage.message), products: []),
        ]),
      );

      await cubit.getProducts(pagination);
    });

    test('emit loading and fail fetching due to network error', () async {
      final failureNetwork = NetworkException(message: "No internet connection");
      setUpMockGetProducts(Left(NetworkFailure(failureNetwork.message)));

      expectLater(
        cubit.stream,
        emitsInOrder([
          ProductListState(status: Status.loading(), products: []),
          ProductListState(status: Status.error(message: failureNetwork.message), products: []),
        ]),
      );

      await cubit.getProducts(pagination);
    });

    test('emit loading and fail fetching due to unknown error', () async {
      final failureUnknown = Exception("Unknown error");
      setUpMockGetProducts(Left(UnknownFailure(failureUnknown.toString())));

      expectLater(
        cubit.stream,
        emitsInOrder([
          ProductListState(status: Status.loading(), products: []),
          ProductListState(status: Status.error(message: failureUnknown.toString()), products: []),
        ]),
      );

      await cubit.getProducts(pagination);
    });

    test('emit success with large limit pagination', () async {
      final paginationLargeLimit = Pagination(limit: 50, currentPage: 0);
      setUpMockGetProducts(Right(products));

      expectLater(
        cubit.stream,
        emitsInOrder([
          ProductListState(status: Status.loading(), products: []),
          ProductListState(status: Status.success(), products: products),
        ]),
      );

      await cubit.getProducts(paginationLargeLimit);
    });

    test('reset state emits close and empty state', () async {
      cubit.close();

      expect(
        cubit.state,
        equals(ProductListState()),
      );
    });
  });
}
