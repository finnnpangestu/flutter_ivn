import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ivn/app/global/widgets/bottom_nav_scaffold/g_bottom_nav_scaffold.dart';
import 'package:flutter_ivn/app/router/app_router.dart';

@RoutePage()
class MainFeaturePage extends StatefulWidget {
  const MainFeaturePage({super.key});

  @override
  State<MainFeaturePage> createState() => _MainFeaturePageState();
}

class _MainFeaturePageState extends State<MainFeaturePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        context.router.replace(DashboardRoute());
        break;
      case 1:
        context.router.replace(ProductListRoute());
        break;
      case 2:
        // context.router.push(ProductListRoute());
        break;
      case 3:
        // context.router.push(ProductListRoute());
        break;
    }
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.square_line_vertical_square),
      label: 'Product',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GBottomNavScaffold(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: items,
      child: const AutoRouter(),
    );
  }
}
