import 'dart:async';
import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';
import 'package:getx_clean_architecture/data/providers/network/app_exception.dart';
import 'package:getx_clean_architecture/data/providers/network/http_method.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}


