import 'package:dio/dio.dart';

import 'failures.dart';

class ServerFailures extends Failures {
  ServerFailures(super.message);

  factory ServerFailures.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailures('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailures('badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailures('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailures('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailures('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailures('There is a problem with server, please try later');
    } else if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 409) {
      return ServerFailures(response['message']);
    } else {
      return ServerFailures('There was an error , please try again');
    }
  }
}
