import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featutred_books_state.dart';

class FeatutredBooksCubit extends Cubit<FeatutredBooksState> {
  FeatutredBooksCubit(this.homerepo) : super(FeatutredBooksInitial());
  final HomeRepo homerepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeatutredBooksloading());
    var result = await homerepo.fetchFeatureBooks();
    result.fold((failure) {
      emit(FeatutredBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeatutredBooksSuccess(books));
    });
  }
}
