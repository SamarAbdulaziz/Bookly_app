import 'package:bookly_app_tharwat/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app_tharwat/core/errors/failure.dart';
import 'package:bookly_app_tharwat/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      } //better for perrformance

      //data['items'].map((item) => books.add(BookModel.fromJson(item))).toList(); //working
      //data['items'].forEach((element)=>books.add(BookModel.fromJson(element)));//working
      print(data['totalItems']);//200
      print(books[1].id);//R6DAi96kKGAC

      return right(books);
    } catch (e) {
      if (e is DioException) {
        debugPrint('errrrrrrrrrror');
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      //print(books[0].toString());

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
