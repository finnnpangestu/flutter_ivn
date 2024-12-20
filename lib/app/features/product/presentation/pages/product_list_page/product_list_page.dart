import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/state_management/product_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/state_management/product_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/state_management/product_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/widgets/product_list_card.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeletons_grid_loader.dart';

@RoutePage()
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      title: 'Product List',
      body: BlocProvider(
        create: (context) => ProductBloc()..add(const ProductEvent.getProducts()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state.productsStatus.when(
              initial: () => const SkeletonsGridLoader(itemCount: 30),
              loading: () => const SkeletonsGridLoader(itemCount: 30),
              loaded: (products) {
                return GridView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListCard(product: products[index]);
                  },
                );
              },
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
