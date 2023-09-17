import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_tharwat/core/utils/app_router.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: Container(
        height: 130.0,
        // margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: NewestBooksImage(
                imageUrl: book.image??'',
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      // 'Harry Potter and the Goblet of Fire',
                      book.title??'',
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    book.authorName??'',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewestBooksImage extends StatelessWidget {
  const NewestBooksImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
