import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_tharwat/core/utils/app_router.dart';
import 'package:bookly_app_tharwat/core/utils/assets.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Container(
        height: 130.0,
        // margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(7.0),
                    image: DecorationImage(
                      image: AssetImage(
                        AssetsData.testImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
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
                      'Harry Potter and the Goblet of Fire',
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
                    'J.K. Rowling',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color:Colors.white70,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '19.99 €',
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
