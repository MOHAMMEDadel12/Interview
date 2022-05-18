import 'package:dio/dio.dart';

import '../../components/constants.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '${baseURL}',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
