import 'package:dio/dio.dart';

class BaseClient {
  final dio = Dio();

  request(String url) async {
    try {
      var response = await dio.get('https://bhagavadgitaapi.in/slok/$url');
      return response;
    } catch (e) {
      print(e);
    }
    // print(responsreturn e.data.toString());
  }
}
