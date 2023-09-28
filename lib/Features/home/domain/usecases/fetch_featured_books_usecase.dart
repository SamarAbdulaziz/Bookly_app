import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_tharwat/core/errors/failure.dart';
import 'package:bookly_app_tharwat/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);



  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
    //we may need to add code here like -> check permission
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }

  // Future<Either<Failure, List<BookModel>>> call() {
  //   //we may need to add code here like -> check permission
  //   return homeRepo.fetchFeaturedBooks();
  // }
}
