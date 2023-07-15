import 'package:bookly_app_tharwat/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app_tharwat/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app_tharwat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextfield(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Search Results',
              style: Styles.textStyle18,
            ),
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),


    );
  }
}

