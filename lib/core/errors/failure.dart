import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

factory ServerFailure.fromDioError(DioException dioException){

  switch(dioException.type){
    case DioExceptionType.connectionTimeout:
      return  ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
      return  ServerFailure('Send timeout with ApiServer');
       case DioExceptionType.receiveTimeout:
      return  ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.cancel:
      return  ServerFailure('Request cancelled');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){//i think we need to edit it
          return ServerFailure('No internet connection');
        }
      return  ServerFailure('Unexpected error ,Please try again');

    case DioExceptionType.badCertificate:
      return  ServerFailure('Bad Certificate');
    case DioException.badResponse:
      return ServerFailure.fromResponse(dioException.response!.statusCode,dioException.response!.data);
    default:
      return ServerFailure('Opps There was an Error, Please try again');
  }
}
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
