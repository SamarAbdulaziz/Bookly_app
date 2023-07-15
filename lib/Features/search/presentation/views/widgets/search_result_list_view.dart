import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(

        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BooksListViewItem(),
      ),
    );
  }
}
