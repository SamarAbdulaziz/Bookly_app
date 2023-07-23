import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_book_item_image.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/fetured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_widget_indicator.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatutredBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (cont, index) => CustomBookItemImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks!.thumbnail),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMsg);
        } else {
          return const CustomWidgetIndicator();
        }
      },
    );
  }
}
