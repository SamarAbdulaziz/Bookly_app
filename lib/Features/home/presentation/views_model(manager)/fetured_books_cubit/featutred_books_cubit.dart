import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featutred_books_state.dart';

class FeatutredBooksCubit extends Cubit<FeatutredBooksState> {
  FeatutredBooksCubit(this.homeRepo) : super(FeatutredBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeatutredBooksloading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold((failure) {
      emit(FeatutredBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeatutredBooksSuccess(books));
    });
  }
}
