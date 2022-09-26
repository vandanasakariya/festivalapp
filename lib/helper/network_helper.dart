import 'dart:convert';
import 'package:festivalapp/helper/exception.dart';
import 'package:festivalapp/theam/app_string.dart';
import 'package:http/http.dart' as http;

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();
  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  static const String BASE_URL = AppString.baseUrl;

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = BASE_URL + url;

      final response =
          await client.post(Uri.parse(fullURL), body: body, headers: header);

      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, String>? header, bool isToken = true, String? body}) async {
    final client = http.Client();
    try {
      final String fullURL = BASE_URL + url;
      final response = await client.get(Uri.parse(fullURL), headers: header);
      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          try {
            if (response.body.isEmpty) {
              throw AppException(
                  message: 'Response body is empty', errorCode: 0);
            }
            return jsonDecode(utf8.decode(response.bodyBytes));
          } catch (e) {
            rethrow;
          }
        default:
          try {
            if (response.body.isEmpty) {
              throw AppException(
                  message: 'Response body is empty',
                  errorCode: response.statusCode);
            }
            final Map<String, dynamic> data = jsonDecode(response.body);
            throw AppException(
                message: "error : ${data['Error']}",
                errorCode: response.statusCode);
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }
}
