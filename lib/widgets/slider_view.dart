import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class SliderView extends StatelessWidget {
  const SliderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Color.fromARGB(255, 248, 169, 84), blurRadius: 30)
      ], color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
      child: CarouselSlider.builder(
          itemCount: 6,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.asset(
                    'assets/store/images (1).jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          options: CarouselOptions(
            height: 200,
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
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
