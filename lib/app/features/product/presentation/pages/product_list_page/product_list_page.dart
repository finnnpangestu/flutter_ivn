import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/widgets/product_list_card.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeletons_grid_loader.dart';

@RoutePage()
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<ProductListBloc>().add(ProductListEvent.getProducts(pagination: context.watch<ProductListBloc>().pagination.nextPage()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagination = context.watch<ProductListBloc>().pagination;

    return GScaffold(
      title: 'Product List',
      body: BlocProvider(
        create: (context) => ProductListBloc()..add(const ProductListEvent.getProducts()),
        child: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            return state.productsStatus.when(
              initial: () => SkeletonsGridLoader(itemCount: pagination.limit),
              loading: () => SkeletonsGridLoader(itemCount: pagination.limit),
              loaded: (products) {
                return GridView.builder(
                  controller: _scrollController,
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
