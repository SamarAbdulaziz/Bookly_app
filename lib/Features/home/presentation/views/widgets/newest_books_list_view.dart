import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_widget_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          // print('from BestsellerListView');
          // print(state.books.length);
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    child: BooksListViewItem(book: state.books[index]),
                  ));
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMsg);
        } else {
          return const CustomWidgetIndicator();
        }
      },
    );
  }
}
