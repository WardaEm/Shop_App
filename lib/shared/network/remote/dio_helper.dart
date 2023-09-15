import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      //Initialvalue in postman =baseurl
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'lang':'en'
      }
    ));
  }

  static Future<Response?> getData(
      {required String url,
        required dynamic query,
        String lang ='ar',
        String ? Authorization,}) async {
    dio?.options.headers={
          'lang':lang,
          'Authorization':Authorization
        };

    //path=methodurl
    return await dio?.get(url, queryParameters: query);
  }
  static Future<Response?>postData(
  {required String url,
     dynamic query,
    String lang ='ar',
    String ? Authorization,
    required Map<String,dynamic>data,
  })
async{
    dio?.options.
      headers= {
        'lang':lang,
        'Authorization':Authorization
      };
    return await dio?.post(url,queryParameters: query,data: data);
  }
}
