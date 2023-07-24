import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CutomAppBar(),
              FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 40.0, bottom: 20.0),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewestBooksListView(),
        ),
      ],
    );

    //   const Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CutomAppBar(),
    //     FeaturedBooksListView(),
    //     Padding(
    //       padding: EdgeInsets.only(left: 30.0, top: 40.0, bottom: 20.0),
    //       child: Text(
    //         'Best Seller',
    //         style: Styles.textStyle18,
    //       ),
    //     ),
    //     BestsellerListView(),
    //   ],
    // );
  }
}
