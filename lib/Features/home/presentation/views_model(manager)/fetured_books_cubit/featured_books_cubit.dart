import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeatutredBooksCubit extends Cubit<FeaturedBooksState> {
  FeatutredBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksloading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
