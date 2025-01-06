import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 325,
            decoration: BoxDecoration(
              color: Color(0xFFEBEEE3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            bottom: 25,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 48,
              height: 350,
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
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width - 48,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate((widget.images ?? []).length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 7 : 5,
                    height: currentIndex == index ? 7 : 5,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Color(0xFF8ECB71) : Color(0xFFD9D9D9),
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
