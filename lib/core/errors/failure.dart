import 'package:dio/dio.dart';

abstract class Failure {
  String msg;
  int? statusCode;
  Failure(
    this.msg, {
    this.statusCode,
  });
}

class ServerFailure extends Failure {
  ServerFailure(
    super.msg, {
    super.statusCode,
  });

  factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out ,please try again later!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out ,please try again later!');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error ,please try again later!');
      case DioExceptionType.cancel:
        return ServerFailure(
            'Request has been cancelled ,please try again later!');
      case DioExceptionType.badResponse:
        if (exception.response!.data['error'] != null) {
          return ServerFailure(
            exception.response!.data['error']['message'],
            statusCode: exception.response!.statusCode,
          );
        }
        return ServerFailure(
            'Opps an unexpected error occurred ,please try again later!');
      default:
        return ServerFailure(
            'Opps an unexpected error occurred ,please try again later!');
    }
  }
}
