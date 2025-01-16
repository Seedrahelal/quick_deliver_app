import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  final List<String> imageUrls;

  const SliderView({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const Center(
        child: Text(
          'No images to display',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(255, 248, 169, 84), blurRadius: 10)
        ],
        border: Border.all(
          color: const Color.fromARGB(255, 196, 104, 6),
          width: 3,
        ),
        color: const Color.fromARGB(255, 235, 180, 122),
        borderRadius: BorderRadius.circular(50),
      ),
      child: CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Image.network(
          imageUrls[itemIndex],
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 100),
        ),
        options: CarouselOptions(
          height: 220,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
