import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_tharwat/Features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

// class NewestBooksCubit extends Cubit<NewestBooksState> {
//   NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
//   final HomeRepo homeRepo;
//
//   Future<void> fetchNewestBooks() async {
//     emit(NewestBooksLoading());
//     var result = await homeRepo.fetchNewestBooks();
//     result.fold((failure) {
//       emit(NewestBooksFailure(failure.errMessage));
//     }, (books) {
//       print('from cubit');
//       print(books.length);
//
//
//       emit(NewestBooksSuccess(books));
//     });
//   }
// }
class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
   var result= await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
