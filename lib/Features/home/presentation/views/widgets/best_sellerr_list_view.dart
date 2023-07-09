import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestsellerListView extends StatelessWidget {
  const BestsellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) => const BestSellerListViewItem()));
  }
}
