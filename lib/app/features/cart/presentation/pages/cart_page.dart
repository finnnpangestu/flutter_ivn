import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/cart/presentation/widgets/cart_card.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_state.dart';
import 'package:flutter_ivn/app/global/widgets/scaffold/g_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      title: "Cart",
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
          final groupCart = <int, Map<String, dynamic>>{};

          for (var product in (state.carts)) {
            if (product.id != null) {
              if (groupCart.containsKey(product.id)) {
                groupCart[product.id]!['quantity'] += 1;
              } else {
                groupCart[product.id!] = {
                  'product': product,
                  'quantity': 1,
                };
              }
            }
          }

          final uniqueCart = groupCart.values.toList();

          if (uniqueCart.isEmpty) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconify(Bx.cart, size: 100, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text("Cart is empty", style: GoogleFonts.inter(fontSize: 18, color: Colors.grey)),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              ...uniqueCart.map((product) => CardCard(product: product['product'], quantity: product['quantity'])),
            ],
          );
        },
      ),
    );
  }
}
