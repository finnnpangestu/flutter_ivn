import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class GStarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;
  final double? size;

  const GStarRating({super.key, this.starCount = 5, this.rating = 0, this.color = Colors.amber, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        starCount,
        (index) {
          Iconify icon;

          if (index >= rating) {
            icon = Iconify(MaterialSymbols.star_outline_rounded, size: size, color: color);
          } else if (index > rating - 1 && index < rating) {
            icon = Iconify(MaterialSymbols.star_half_rounded, size: size, color: color);
          } else {
            icon = Iconify(MaterialSymbols.star_rounded, size: size, color: color);
          }

          return icon;
        },
      ),
    );
  }
}
