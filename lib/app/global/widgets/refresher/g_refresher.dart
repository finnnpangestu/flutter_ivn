import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GRefresher extends StatelessWidget {
  final RefreshController refreshController;
  final Function()? onLoading, onRefresh;
  final Widget? child;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  const GRefresher({
    super.key,
    required this.refreshController,
    this.onLoading,
    this.onRefresh,
    this.child,
    this.scrollPhysics,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) => true,
      child: SmartRefresher(
        physics: scrollPhysics,
        controller: refreshController,
        enablePullDown: onRefresh != null,
        enablePullUp: onLoading != null,
        onLoading: onLoading,
        onRefresh: onRefresh,
        scrollController: scrollController,
        header: MaterialClassicHeader(
          color: Colors.green,
        ),
        child: child,
      ),
    );
  }
}
