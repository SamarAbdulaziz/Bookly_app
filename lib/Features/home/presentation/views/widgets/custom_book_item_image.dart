import 'package:flutter/material.dart';

class CustomBookItemImage extends StatelessWidget {
  const CustomBookItemImage({
    super.key, required this.imageUrl,
  });
final String imageUrl;
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
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.fill,
                )),
          )),
    );
  }
}
