import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class ServerFailure extends Failure {


  const ServerFailure(
      {required String message,
      })
      : super(
          message: message,
        );

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'connectionTimeout', );
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure(message: 'badCertificate', );
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerFailure(message: 'cancel', );
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        return ServerFailure(
            message: 'internet connection error', );
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        return ServerFailure(
            message: error.stackTrace.toString(), );
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'sendTimeout', );
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'receiveTimeout', );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response?.statusCode ?? 0, error.response?.data);
      default:
        return ServerFailure(message: '===>error<===',);
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 401) {
      return ServerFailure(
          message: response['message'],
        );
    } else {
      return ServerFailure(
          message: 'Opps There was an error. Please try again', );
    }
  }
}
