import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/main/presentation/controllers/main_cubit.dart';
import 'package:flutter_ivn/app/features/main/presentation/controllers/main_state.dart';
import 'package:flutter_ivn/app/global/widgets/bottom_nav_scaffold/g_bottom_nav_scaffold.dart';

@RoutePage()
class MainFeaturePage extends StatelessWidget {
  MainFeaturePage({super.key});

  final List<BottomNavigationBarItem> items = [
    // BottomNavigationBarItem(
    //   icon: Icon(CupertinoIcons.home),
    //   label: 'Home',
    // ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.square_line_vertical_square),
      label: 'Product',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      label: 'Cart',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(CupertinoIcons.person),
    //   label: 'Profile',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final read = context.read<MainCubit>();

        return GBottomNavScaffold(
          currentIndex: state.currentIndex,
          onTap: (value) => read.onTabTapped(value, context),
          items: items,
          child: const AutoRouter(),
        );
      },
    );
  }
}
