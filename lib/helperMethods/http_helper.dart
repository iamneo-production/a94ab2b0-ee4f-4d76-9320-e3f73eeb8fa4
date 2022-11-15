import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<http.Response> postRequest(
      String url, Map<String, String> headerMap, Map bodyMap) async {
    return await http.post(
      Uri.parse(url),
      headers: headerMap,
      body: jsonEncode(bodyMap),
    );
  }

  static Future<http.Response> getRequest(
      {required String url, Map<String, String>? headers}) async {
    return await http.get(Uri.parse(url), headers: headers);
  }
}
