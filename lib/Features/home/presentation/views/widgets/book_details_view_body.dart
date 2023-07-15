import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/books_detals_section.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custombook_details_appbar.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/simillar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBookDetailsAppBar(),
                BooksDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),
                SimillarBooksSection(),
                SizedBox(
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
