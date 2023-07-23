import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_book_item_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (cont, index) => const CustomBookItemImage(imageUrl: "http://books.google.com/books/content?id=HK1MDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",)),
    );
  }
}
