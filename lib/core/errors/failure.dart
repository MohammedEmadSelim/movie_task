import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final bool status;
  final Map<String, dynamic>? errors;

  const Failure({required this.message, required this.status,this.errors});

  @override
  List<Object> get props => [message, status];
}

class ServerFailure extends Failure {
  final Map<String, dynamic>? errors;

  const ServerFailure(
      {this.errors, required String message, required bool status})
      : super(message: message, status: status,errors: errors);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'connectionTimeout', status: false);
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure(message: 'badCertificate', status: false);
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerFailure(message: 'cancel', status: false);
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        return ServerFailure(message: 'internet connection error', status: false);
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        return ServerFailure(message: error.stackTrace.toString(), status: false);
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'sendTimeout', status: false);
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure(message: 'receiveTimeout', status: false);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response?.statusCode ?? 0, error.response?.data);
      default:
        return ServerFailure(message: '===>error<===', status: false);
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 401) {
      return ServerFailure(message: response['message']  , status: false,errors: response['errors']);
    } else {
      return ServerFailure(
          message: 'Opps There was an error. Please try again', status: false);
    }
  }
}
