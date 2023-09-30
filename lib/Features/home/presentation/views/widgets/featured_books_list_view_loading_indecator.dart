import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_book_item_image_loading_indicator.dart';
import 'package:bookly_app_tharwat/core/widgets/fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(

            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount:15,
            //  state is FeaturedBooksSuccess ? state.books.length : 0,
            itemBuilder: (cont, index) => const CustomBookImageLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
