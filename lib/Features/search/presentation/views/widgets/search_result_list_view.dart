import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_tharwat/core/utils/service_locator/service_locator.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_widget_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(//todo its not the correct cubit
      create: (context) => NewestBooksCubit(getIt.get<HomeRepoImplementation>()),
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if(state is NewestBooksSuccess){return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) =>
             Padding(

              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BooksListViewItem(book: state.books[index]),
            ),
          );}
          else if (state is NewestBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMsg);
          } else {
            return const CustomWidgetIndicator();
          }
        },
      ),
    );
  }
}
