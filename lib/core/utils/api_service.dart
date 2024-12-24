import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  Future<Response> get(String url) async {
    var response =  await dio.get(url);
    return response;
  }
  Future<Response> post({required String url,
    required Map<String, dynamic> data,
    required String token,String ? contentType,
    Map<String, String>? headers
  }) async {
    var response = await dio.post(url,
        data: data,
        options: Options(
           contentType: contentType,
            headers: headers ?? {'Authorization': 'Bearer $token'}));
    return response;
  }

}
// the best use Authorization ( without bearerToken )
/*
Future<Response> postWithBasicAuth({
  required String url,
  required Map<String, dynamic> data,
  required String secretKey, // Your Stripe Secret Key
  String? contentType,
}) async {
  // Encode the Secret Key as Basic Auth
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$secretKey:'))}';

  var response = await dio.post(
    url,
    data: data,
    options: Options(
      contentType: contentType,
      headers: {'Authorization': basicAuth},
    ),
  );

  return response;
}

 */