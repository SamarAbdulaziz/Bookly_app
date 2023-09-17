import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/books_detals_section.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custombook_details_appbar.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/simillar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBookDetailsAppBar(),
                BooksDetailsSection(book: book),
                const Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),
                const SimillarBooksSection(),
                const SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
