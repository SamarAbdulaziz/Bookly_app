import 'package:bookly_app_tharwat/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookItemImage extends StatelessWidget {
  const CustomBookItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(
                    AssetsData.testImage,
                  ),
                  fit: BoxFit.fill,
                )),
          )),
    );
  }
}
