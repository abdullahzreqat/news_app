import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsdata.io/",
      receiveDataWhenStatusError: true,
    ));
  }
  
  static Future<Response> getData({required Map<String,String> query}) async{
    return await dio.get("api/1/news",queryParameters: query);
  }
}
