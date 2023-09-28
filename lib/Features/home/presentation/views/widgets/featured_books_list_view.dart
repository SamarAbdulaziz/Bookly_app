import 'package:bookly_app_tharwat/Features/home/presentation/views/widgets/custom_book_item_image.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/fetured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_tharwat/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_widget_indicator.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollList = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollList) {
      BlocProvider.of<FeaturedBooksCubit>(context)
          .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (cont, index) =>
                    CustomBookItemImage(imageUrl: state.books[index].image),
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
// class FeaturedBooksListView extends StatefulWidget {
//   const FeaturedBooksListView({
//     Key? key,
//   }) : super(key: key);
//
//   //final List<BookEntity> books;
//
//   @override
//   State<StatefulWidget> createState() => _FeaturedBooksListViewState();
// }
//
// class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
//   late final ScrollController _scrollController;
//   var nextPage = 1;
//
//   var isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   void _scrollListener() async {
//     var currentPositions = _scrollController.position.pixels;
//     var maxScrollLength = _scrollController.position.maxScrollExtent;
//     if (currentPositions >= 0.7 * maxScrollLength) {
//       if (!isLoading) {
//         isLoading = true;
//         await BlocProvider.of<FeaturedBooksCubit>(context)
//             .fetchFeaturedBooks(pageNumber: nextPage++);
//         isLoading = false;
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is FeaturedBooksSuccess) {
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * .3,
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: state.books.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: CustomBookItemImage(
//                       imageUrl: state.books[index].image ?? '',
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else if (state is FeaturedBooksFailure) {
//             return CustomErrorWidget(errMessage: state.errMsg);
//           } else {
//             return const CustomWidgetIndicator();
//           }
//         });
//   }
// }
