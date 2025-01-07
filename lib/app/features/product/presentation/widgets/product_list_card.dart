import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/global/widgets/star_rating/g_star_rating.dart';
import 'package:flutter_ivn/app/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class ProductListCard extends StatelessWidget {
  final Product? product;

  const ProductListCard({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final double discountPrice = (product?.price ?? 0) - ((product?.price ?? 0) * (product?.discountPercentage ?? 0) / 100);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        context.router.push(ProductDetailRoute(id: (product?.id ?? 0).toString()));
      },
      onHover: (value) {},
      borderRadius: BorderRadius.circular(4),
      child: Container(
          // padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFFEBEEE3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      colorBlendMode: BlendMode.darken,
                      product?.thumbnail ?? '',
                      height: size.height,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Title */
                    Text(
                      product?.title ?? '-',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),

                    /* Sub Title */
                    Text(
                      product?.description ?? '-',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),

                    /* Rating */
                    GStarRating(
                      rating: product?.rating ?? 0,
                      size: 20,
                      starCount: 5,
                      color: Color(0xFF3D713C),
                    ),

                    /* Price */
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
                        const SizedBox(width: 6),
                        Text(
                          '${product?.price}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color(0xFFADADAD),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              elevation: 0,
                              side: BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Iconify(
                                  Bx.cart_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
