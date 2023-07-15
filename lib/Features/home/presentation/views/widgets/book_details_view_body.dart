import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custombook_details_appbar.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_book_item_image.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
     slivers: [
       SliverFillRemaining(
         hasScrollBody: false,
         child:  Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const CustomBookDetailsAppBar(),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                 child: const CustomBookItemImage(),
               ),
               const SizedBox(
                 height: 45.0,
               ),
               Text(
                 'The Jungle Book',
                 style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
               ),
               const SizedBox(
                 height: 6.0,
               ),
               Text(
                 'Rudyard Kipling',
                 style: Styles.textStyle18.copyWith(
                   fontStyle: FontStyle.italic,
                   color: Colors.white70,
                 ),
               ),
               const SizedBox(
                 height: 16.0,
               ),
               const BookRating(),
               const SizedBox(
                 height: 37.0,
               ),
               const BooksAction(),
               const Expanded(
                 child: SizedBox(
                   height: 50.0,
                 ),
               ),
               Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                   'You can also like',
                   style: Styles.textStyle14.copyWith(
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               const SizedBox(
                 height: 16.0,
               ),
               const SimilarBooksListView(),
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

