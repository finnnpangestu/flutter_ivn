import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/features/main/presentation/main_feature.dart';
import 'package:flutter_ivn/app/features/dashboard/presentation/pages/dashboard_page/dashboard_page.dart';
import 'package:flutter_ivn/app/features/product/presentation/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter_ivn/app/features/product/presentation/pages/product_list_page/product_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /* Main */
        AutoRoute(
          page: MainFeatureRoute.page,
          initial: true,
          children: <AutoRoute>[
            /* Dashboard */
            AutoRoute(
              path: "dashboard",
              page: DashboardRoute.page,
              initial: true,
            ),

            /* Product */
            AutoRoute(
              path: "products",
              page: ProductListRoute.page,
            ),
          ],
        ),

        /* Product Detail */
        AutoRoute(
          path: "/product/:id",
          page: ProductDetailRoute.page,
        ),
      ];
}
