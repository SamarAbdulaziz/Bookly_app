import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_tharwat/Features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

// class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
//   FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
//   final HomeRepo homeRepo;
//
//   Future<void> fetchFeatureBooks() async {
//     emit(FeaturedBooksloading());
//     var result = await homeRepo.fetchFeaturedBooks();
//     result.fold((failure) {
//       emit(FeaturedBooksFailure(failure.errMessage));
//     }, (books) {
//       emit(FeaturedBooksSuccess(books));
//     });
//   }
// }
class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
