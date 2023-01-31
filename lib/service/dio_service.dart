import 'dart:developer';
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      // log(response.toString());
      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    print(map);
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    }).catchError((err) {
      log(err.toString());
      if (err is DioError) {
        return err.response!;
      }
    });
  }

  Future<dynamic> putMethod(Map<String, dynamic> map, String url) async {
    print(map);
    return await dio
        .put(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'PUT'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    }).catchError((err) {
      log(err.toString());
      if (err is DioError) {
        return err.response!;
      }
    });
  }

  Future<dynamic> deleteMethod(String url) async {
    return await dio
        .delete(url,
            options: Options(responseType: ResponseType.json, method: 'DELETE'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    }).catchError((err) {
      log(err.toString());
      if (err is DioError) {
        return err.response!;
      }
    });
  }
}
