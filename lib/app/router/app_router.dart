import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_ivn/app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_ivn/app/features/main/presentation/main_feature.dart';
import 'package:flutter_ivn/app/features/product/presentation/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter_ivn/app/features/product/presentation/pages/product_list_page/product_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /* Auth */
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
          initial: true,
        ),

        /* Main */
        AutoRoute(
          page: MainFeatureRoute.page,
          children: <AutoRoute>[
            /* Dashboard */
            // AutoRoute(
            //   path: "dashboard",
            //   page: DashboardRoute.page,
            //   initial: true,
            // ),

            /* Product */
            AutoRoute(
              path: "products",
              page: ProductListRoute.page,
            ),

            /* Cart */
            AutoRoute(
              path: "cart",
              page: CartRoute.page,
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
