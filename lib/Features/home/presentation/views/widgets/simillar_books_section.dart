import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimillarBooksSection extends StatelessWidget {
  const SimillarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
