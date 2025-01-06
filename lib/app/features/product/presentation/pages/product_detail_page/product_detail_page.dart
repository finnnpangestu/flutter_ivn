import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_event.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/global/widgets/image_slider/g_image_slider.dart';
import 'package:flutter_ivn/app/global/widgets/refresher/g_refresher.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<ProductDetailBloc>().add(GetProductDetailEvent(widget.id));
    super.initState();
  }

  void _onRefresh() async {
    context.read<ProductDetailBloc>().add(GetProductDetailEvent(widget.id));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: null,
            child: Iconify(Ri.shopping_bag_line),
          ),
        ),
      ],
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return GRefresher(
            refreshController: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                if (state.status == Status.success()) ...[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          state.product?.title ?? '-',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF0B0B0D),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: null,
                        child: Text(
                          (state.product?.category ?? '-').substring(0, 1).toUpperCase() + (state.product?.category ?? '-').substring(1),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Color(0xFF0B0B0D),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  GImageSlider(
                    images: state.product?.images ?? [],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _DetailTile(tile: 'Brand', value: state.product?.brand ?? '-'),
                      ),
                      Expanded(
                        child: _DetailTile(tile: 'Stock', value: (state.product?.stock ?? 0).toString()),
                      ),
                      Expanded(
                        child: _DetailTile(tile: 'Rating', value: (state.product?.rating ?? 0).toString()),
                      ),
                      Expanded(
                        child: _DetailTile(tile: 'SKU', value: state.product?.sku ?? '-'),
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    state.product?.description ?? '-',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          final double discountPrice = (state.product?.price ?? 0) - ((state.product?.price ?? 0) * (state.product?.discountPercentage ?? 0) / 100);

          return Container(
            padding: EdgeInsets.all(20),
            // width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'PRICE',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: Color(0xFF555555),
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '\$ ${discountPrice.toStringAsFixed(2)}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Color(0xFF3D713C),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '${state.product?.price}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Color(0xFFADADAD),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xFFADADAD), width: 2, style: BorderStyle.solid),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                  ),
                  child: Iconify(
                    Bx.message_square_dots,
                    size: 20,
                    color: Color(0xFFADADAD),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(
                        Bx.cart_alt,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final String tile;
  final String value;

  const _DetailTile({
    required this.tile,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tile,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
