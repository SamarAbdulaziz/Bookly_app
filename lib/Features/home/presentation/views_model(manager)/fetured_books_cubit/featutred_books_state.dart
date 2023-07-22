part of 'featutred_books_cubit.dart';

@immutable
abstract class FeatutredBooksState extends Equatable {
  const FeatutredBooksState();

  @override
  List<Object> get props => [];
}

class FeatutredBooksInitial extends FeatutredBooksState {}

class FeatutredBooksloading extends FeatutredBooksState {}

class FeatutredBooksSuccess extends FeatutredBooksState {
  final List<BookModel> books;

  FeatutredBooksSuccess(this.books);
}

class FeatutredBooksFailure extends FeatutredBooksState {
  final String errMsg;

  FeatutredBooksFailure(this.errMsg);
}
