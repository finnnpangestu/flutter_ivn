import 'package:flutter/material.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeleton_loader.dart';

class SkeletonsListLoader extends StatelessWidget {
  final int itemCount;

  const SkeletonsListLoader({
    super.key,
    this.itemCount = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            SkeletonLoader(height: 60, width: 60, borderRadius: BorderRadius.circular(8)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SkeletonLoader(height: 16, width: double.infinity),
                  SizedBox(height: 8),
                  SkeletonLoader(height: 14, width: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
