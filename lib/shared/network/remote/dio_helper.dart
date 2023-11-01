import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/everything',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}



////https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=372ac5c8751f4bb0a0624f15df043f98
//base url : https://newsapi.org/v2/top-headlines
//method(url):country=eg&category=sports&category=business
//key(url):372ac5c8751f4bb0a0624f15df043f98

/*https://newsapi.org/v2/top-headlines?country=eg&category=sports&category=business&apiKey=372ac5c8751f4bb0a0624f15df043f98*/
