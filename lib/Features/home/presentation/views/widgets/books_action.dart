import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            backgroundColor: Colors.white,
            text: '19.99 € €',
            style: Styles.textStyle18.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          CustomButton(
            backgroundColor: const Color(0xffEF8262),
            text: 'Free preview',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
