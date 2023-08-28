// import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
// import 'package:bookly_app_tharwat/Features/home/domain/repos/home_repo.dart';
// import 'package:bookly_app_tharwat/core/errors/failure.dart';
// import 'package:bookly_app_tharwat/core/utils/api_service.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// class HomeRepoImplementation implements HomeRepo {
//   final ApiService apiService;
//
//   HomeRepoImplementation(this.apiService);
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
//     try {
//       var data = await apiService.get(
//           endPoint:
//               'volumes?Filtering=free-ebooks&q=subject:programming'); //'volumes?Filtering=free-ebooks&q=subject:Programming
//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       // print(data['totalItems']); //200
//       // print(books[0].id); //HK1MDwAAQBAJ
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       var data = await apiService.get(
//           endPoint:
//               'volumes?Filtering=free-ebooks&Sorting=newest&q=programming'); //volumes?Filtering=free-ebooks&Sorting=newest &q=computer science
//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       } //better for perrformance
//
//       //data['items'].map((item) => books.add(BookModel.fromJson(item))).toList(); //working
//       //data['items'].forEach((element)=>books.add(BookModel.fromJson(element)));//working
//       //print(data['items'].toString()); //96
//       // print('from HomeRepoImplementation');
//       // print(books.length);
//
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         debugPrint('errrrrrrrrrror');
//         return left(ServerFailure.fromDioError(e));
//       }
//        return left(ServerFailure(e.toString()));
//     }
//   }
// }
// //
// // import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
// // import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
// // import 'package:bookly_app_tharwat/core/errors/failure.dart';
// // import 'package:bookly_app_tharwat/core/utils/api_service.dart';
// // import 'package:dartz/dartz.dart';
// // import 'package:dio/dio.dart';
// //
// // class HomeRepoImplementation implements HomeRepo {
// //   final ApiService apiService;
// //
// //   HomeRepoImplementation(this.apiService);
// //   @override
// //   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
// //     try {
// //       var data = await apiService.get(
// //           endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
// //       List<BookModel> books = [];
// //       for (var item in data['items']) {
// //         books.add(BookModel.fromJson(item));
// //       }
// //
// //       return right(books);
// //     } catch (e) {
// //       if (e is DioException) {
// //         return left(
// //           ServerFailure.fromDioError(e),
// //         );
// //       }
// //       return left(
// //         ServerFailure(
// //           e.toString(),
// //         ),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
// //     try {
// //       var data = await apiService.get(
// //           endPoint:
// //           'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
// //       List<BookModel> books = [];
// //       for (var item in data['items']) {
// //         try {
// //           books.add(BookModel.fromJson(item));
// //         } catch (e) {
// //           books.add(BookModel.fromJson(item));
// //         }
// //       }
// //
// //       return right(books);
// //     } catch (e) {
// //       if (e is DioException) {
// //         return left(
// //           ServerFailure.fromDioError(e),
// //         );
// //       }
// //       return left(
// //         ServerFailure(
// //           e.toString(),
// //         ),
// //       );
// //     }
// //   }
// //
// //
// //   // @override
// //   // Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
// //   //     {required String category}) async {
// //   //   try {
// //   //     var data = await apiService.get(
// //   //         endPoint:
// //   //         'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
// //   //     List<BookModel> books = [];
// //   //     for (var item in data['items']) {
// //   //       books.add(BookModel.fromJson(item));
// //   //     }
// //   //
// //   //     return right(books);
// //   //   } catch (e) {
// //   //     if (e is DioError) {
// //   //       return left(
// //   //         ServerFailure.fromDioError(e),
// //   //       );
// //   //     }
// //   //     return left(
// //   //       ServerFailure(
// //   //         e.toString(),
// //   //       ),
// //   //     );
// //   //   }
// //   // }
// //
// //
// //
// // }