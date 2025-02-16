import 'package:flutter/cupertino.dart';
import 'package:flutter_ivn/app/global/widgets/skeleton/skeleton_loader.dart';

class SkeletonsGridLoader extends StatelessWidget {
  final int itemCount;

  const SkeletonsGridLoader({
    super.key,
    this.itemCount = 10,
  });

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1 / 2,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(height: fullWidth * .5, width: fullWidth, borderRadius: BorderRadius.circular(8)),
            const SizedBox(height: 6),
            SkeletonLoader(height: 16, width: fullWidth),
            const SizedBox(height: 4),
            SkeletonLoader(height: 14, width: fullWidth),
            const SizedBox(height: 4),
            SkeletonLoader(height: 14, width: fullWidth),
            const SizedBox(height: 6),
            Row(
              children: [
                SkeletonLoader(height: 24, width: 60),
                const SizedBox(width: 4),
                SkeletonLoader(height: 24, width: 60),
              ],
            ),
            const SizedBox(height: 6),
            SkeletonLoader(height: 40, width: double.infinity),
          ],
        ),
      ),
    );
  }
}
