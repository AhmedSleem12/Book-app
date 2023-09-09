import 'package:dio/dio.dart';

abstract class Faliure {
  final String msgError;

  Faliure(this.msgError);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.msgError);

  factory ServerFaliure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFaliure("Connection Timed Out With Api Server");
      case DioErrorType.sendTimeout:
        return ServerFaliure("Send Timed Out With Api Server");
      case DioErrorType.receiveTimeout:
        return ServerFaliure("Receive Timed Out With Api Server");
      case DioErrorType.response:
        return ServerFaliure.fromResponseError(
            dioError.response!.statusCode!, dioError.response!);

      case DioErrorType.cancel:
        return ServerFaliure("The Operation Was Cancled, Please Try Later!");

      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          return ServerFaliure("Sorry, No Internet Connection");
        }
        return ServerFaliure("Opss, something wrong please try later!");
      default:
        return ServerFaliure("Opss, something wrong please try later!");
    }
  }
  factory ServerFaliure.fromResponseError(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFaliure("Method not found, Please Try Later!");
    }
    return ServerFaliure("Internal Server Errro, Please Try Later!");
  }
}
