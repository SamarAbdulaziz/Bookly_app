import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/feature_list_view_item.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CutomAppBar(),
        FeaturedBooksListView(),
        Padding(
          padding: EdgeInsets.only(left: 24.0, top: 40.0),
          child: Text(
            'Best Seller',
            style: Styles.mediamTitle,
          ),
        ),
      ],
    );
  }
}
