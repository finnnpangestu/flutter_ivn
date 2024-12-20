import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      title: "Detail",
      body: Center(
        child: Text("Product Detail Page $id"),
      ),
    );
  }
}
