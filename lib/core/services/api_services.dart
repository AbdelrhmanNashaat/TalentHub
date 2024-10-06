import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  final Dio dio;
  ApiServices({required this.dio});

  Future<Map<String, dynamic>> get({required String ednPoint}) async {
    var response = await dio.get(
      ednPoint,
      options: Options(
        headers: {
          'x-rapidapi-key': dotenv.env['API_KEY'],
        },
      ),
    );
    return response.data;
  }
}
