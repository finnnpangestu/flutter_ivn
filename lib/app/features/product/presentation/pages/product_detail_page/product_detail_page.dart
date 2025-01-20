import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_state.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:flutter_ivn/app/global/widgets/image_slider/g_image_slider.dart';
import 'package:flutter_ivn/app/global/widgets/refresher/g_refresher.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeleton_loader.dart';
import 'package:flutter_ivn/app/global/widgets/star_rating/g_star_rating.dart';
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

  List<Widget> skeletonLoader(BuildContext context) => [
        SkeletonLoader(
          height: 24,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(height: 24),
        SkeletonLoader(
          height: 400,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(height: 24),
        SkeletonLoader(
          height: 36,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(height: 24),
        SkeletonLoader(
          height: 48,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(height: 24),
        SkeletonLoader(
          height: 36,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(height: 24),
        SkeletonLoader(
          height: 200,
          width: MediaQuery.of(context).size.width,
        ),
      ];

  @override
  void initState() {
    context.read<ProductDetailCubit>().onGetProductDetail(widget.id);
    super.initState();
  }

  void _onRefresh() async {
    context.read<ProductDetailCubit>().onGetProductDetail(widget.id);
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        final double discountPrice = (state.product?.price ?? 0) - ((state.product?.price ?? 0) * (state.product?.discountPercentage ?? 0) / 100);

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
          body: GRefresher(
            refreshController: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                /* Loading */
                if (state.status == Status.loading()) ...skeletonLoader(context),

                /* Success */
                if (state.status == Status.success()) ...[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          state.product?.title ?? '-',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF0B0B0D),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _DetailTile(tile: 'Brand', value: state.product?.brand ?? '-'),
                      ),
                      Expanded(
                        child: _DetailTile(tile: 'Stock', value: (state.product?.stock ?? 0).toString()),
                      ),
                      Expanded(
                        child: _DetailTile(
                          tile: 'Category',
                          value: (state.product?.category ?? '-').substring(0, 1).toUpperCase() + (state.product?.category ?? '-').substring(1),
                        ),
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
                  SizedBox(height: 24),
                  Text(
                    'Rating & Reviews',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xFF0B0B0D),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.product?.rating ?? 0} / 5',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 28,
                          color: Color(0xFF555555),
                        ),
                      ),
                      GStarRating(
                        rating: state.product?.rating ?? 0,
                        size: 36,
                        starCount: 5,
                        color: Color(0xFF3D713C),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.product?.reviews?.length ?? 0,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFADADAD),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${state.product?.reviews?[index].rating} / 5',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFEBEEE3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.product?.reviews?[index].reviewerName ?? '-',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xFF0B0B0D),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    state.product?.reviews?[index].comment ?? '-',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xFF555555),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(20),
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
                BlocBuilder<ProductListCubit, ProductListState>(
                  builder: (context, stateList) {
                    final read = context.read<ProductListCubit>();

                    return ElevatedButton(
                      onPressed: () {
                        read.onCartProductChange(product: state.product);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (stateList.carts.contains(state.product)) ...[
                            Text(
                              '${stateList.carts.where((element) => element == state.product).length} items',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ] else ...[
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
                        ],
                      ),
                    );
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
