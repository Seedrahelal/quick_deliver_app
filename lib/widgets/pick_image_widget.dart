import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 190,
        height: 190,
        child: CircleAvatar(
          backgroundImage: const AssetImage('assets/images/photo_2024-12-07_10-17-49.jpg'),
          child: Stack(
            children: [
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 116, 33, 51),
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
