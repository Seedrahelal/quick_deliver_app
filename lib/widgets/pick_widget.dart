import 'package:flutter/material.dart';
import 'package:quick_deliver/helper/constants.dart';

class PickWidget extends StatelessWidget {
  const PickWidget(
      {super.key,
      required this.photoAvatar,
      this.onTap,
      required this.iconAvatar,
      required this.height,
      required this.width,
      required this.bottom,
      required this.left});

  final String photoAvatar;
  final dynamic onTap;
  final dynamic iconAvatar;
  final double width;
  final double height;
  final double bottom;
  final double left;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundImage: AssetImage(photoAvatar),
        child: Stack(
          children: [
            Positioned(
              bottom: bottom,
              left: left,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    iconAvatar,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
