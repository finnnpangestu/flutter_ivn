import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GImageSlider extends StatefulWidget {
  final List<String>? images;

  const GImageSlider({super.key, this.images});

  @override
  State<GImageSlider> createState() => _GImageSliderState();
}

class _GImageSliderState extends State<GImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: widget.images?.length ?? 0,
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: widget.images?[index] ?? '',
                    fit: BoxFit.fitHeight,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.green)),
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate((widget.images ?? []).length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Colors.green : Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
