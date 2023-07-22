part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState extends Equatable {
 const NewestBooksState();
  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> newBooks;

  const NewestBooksSuccess(this.newBooks);
}

class NewestBooksFailure extends NewestBooksState {
  final String errMsg;

  const NewestBooksFailure(this.errMsg);
}