import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: SlideTransition(
              //6
              position: slidingAnimation,
              child: const Text(
                'Read Free Books',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          );
        });
  }
}
