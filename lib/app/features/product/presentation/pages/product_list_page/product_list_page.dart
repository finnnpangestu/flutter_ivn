import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/widgets/product_list_card.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/global/widgets/refresher/g_refresher.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeletons_grid_loader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();
  Pagination pagination = Pagination(limit: 10);

  @override
  void initState() {
    context.read<ProductListBloc>().add(ProductListEvent.getProducts(pagination: pagination));
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _onLoading();
      }
    });
  }

  void _onRefresh() async {
    setState(() {
      pagination = pagination.reset();
    });
    context.read<ProductListBloc>().add(ProductListEvent.getProducts(pagination: pagination.reset()));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    setState(() {
      pagination = pagination.nextPage();
    });
    context.read<ProductListBloc>().add(ProductListEvent.getProducts(pagination: pagination.nextPage()));
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      title: 'Product List',
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return GRefresher(
            refreshController: _refreshController,
            scrollController: _scrollController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: state.products.length + (state.status == Status.loadingMore() ? 2 : 0),
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return SkeletonsGridLoader(itemCount: 2);
                }

                return ProductListCard(product: state.products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
