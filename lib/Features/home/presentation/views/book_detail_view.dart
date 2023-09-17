import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(book: book),
      ),
    );
  }
}
