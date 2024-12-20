import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GBottomNavScaffold extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Widget child;
  final List<BottomNavigationBarItem> items;

  const GBottomNavScaffold({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.child,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: CupertinoTabBar(
        height: 72,
        currentIndex: currentIndex,
        activeColor: Colors.green[800],
        inactiveColor: Colors.grey,
        onTap: onTap,
        items: items,
      ),
    );
  }
}
