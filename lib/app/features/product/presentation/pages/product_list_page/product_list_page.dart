import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/widgets/product_list_card.dart';
import 'package:flutter_ivn/app/global/state/pagination/pagination.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/global/widgets/refresher/g_refresher.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeletons_grid_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
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
  Pagination pagination = Pagination(limit: 10, currentPage: 0);
  Timer? debounce;

  @override
  void initState() {
    context.read<ProductListCubit>().getProducts(pagination);
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _onLoading();
      }
    });
  }

  void _onRefresh() async {
    setState(() => pagination = pagination.reset());
    context.read<ProductListCubit>().getProducts(pagination);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    setState(() => pagination = pagination.nextPage());
    context.read<ProductListCubit>().getProducts(pagination);
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        return GScaffold(
          actions: [
            InkWell(
              onTap: () => context.read<ProductListCubit>().filter(context),
              borderRadius: BorderRadius.circular(99),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Iconify(Bx.filter),
              ),
            ),
          ],
          title: 'Product',
          body: GRefresher(
            refreshController: _refreshController,
            scrollController: _scrollController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: ListView(
              controller: _scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SearchBar(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(Color(0xFFF1F1F1)),
                    hintText: 'Search product ... .',
                    hintStyle: WidgetStatePropertyAll(GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color(0xFF777777),
                    )),
                    trailing: [Iconify(Bx.search, size: 24, color: Color(0xFF777777))],
                    textStyle: WidgetStatePropertyAll(GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color(0xFF333333),
                    )),
                    onChanged: (value) {
                      debounce?.cancel();
                      debounce = Timer(Duration(milliseconds: 300), () => context.read<ProductListCubit>().getProducts(pagination.reset(), searchValue: value));
                    },
                    onSubmitted: (value) => context.read<ProductListCubit>().getProducts(pagination.reset(), searchValue: value),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: state.products.length + (state.status == Status.loading() ? 2 : 0),
                  itemBuilder: (context, index) {
                    if (state.status == Status.loading() && index == state.products.length) {
                      return SkeletonsGridLoader(itemCount: 2);
                    }

                    if (state.status == Status.loading() || state.status == Status.initial()) {
                      return SkeletonsGridLoader(itemCount: pagination.limit);
                    }

                    return ProductListCard(product: state.products[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
