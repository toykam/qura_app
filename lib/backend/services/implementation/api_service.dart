
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  // Future<Response> makePostRequest() async {}
  late Dio dio;

  ApiService() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      error: true, request: true, requestBody: true
    ));
  }

  Future<ApiResponse> makeGetRequest(url) async {
    try {
      return await dio.get(url).then((value) => ApiResponse(
        data: value.data, message: value.statusMessage!, status: true
      ));
    } on DioError catch (error) {
      return _handleDioError(error);
    } catch (error) {
      return ApiResponse(status: false, message: 'Error: ${error.toString()}', data: null);
    }
  }

  static ApiResponse _handleDioError(DioError e) {
    if (e.response != null) {
      return ApiResponse(status: false, message: e.response!.statusMessage!, data: null);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      return ApiResponse(status: false, message: e.message, data: null);
    }
  }
}


class ApiResponse {
  bool status = false;
  String message = '';
  dynamic data;

  ApiResponse({this.data, this.message = '', this.status = false});

}