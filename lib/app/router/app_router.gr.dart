// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [MainFeaturePage]
class MainFeatureRoute extends PageRouteInfo<void> {
  const MainFeatureRoute({List<PageRouteInfo>? children})
      : super(
          MainFeatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainFeatureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainFeaturePage();
    },
  );
}

/// generated route for
/// [ProductDetailPage]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return ProductDetailPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ProductListPage]
class ProductListRoute extends PageRouteInfo<void> {
  const ProductListRoute({List<PageRouteInfo>? children})
      : super(
          ProductListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductListPage();
    },
  );
}
