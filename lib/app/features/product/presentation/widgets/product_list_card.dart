import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/global/models/product/product.dart';
import 'package:flutter_ivn/app/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      borderRadius: BorderRadius.circular(4),
      child: Container(
          padding: EdgeInsets.all(8),
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
              const SizedBox(height: 6),

              /* Title */
              Text(
                product?.title ?? '-',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              /* Sub Title */
              Text(
                product?.description ?? '-',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),

              /* Price */
              Row(
                children: [
                  Text(
                    '\$${discountPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '\$${product?.price}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              /* Add Cart Button */
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.cart),
                    const SizedBox(width: 8),
                    Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
