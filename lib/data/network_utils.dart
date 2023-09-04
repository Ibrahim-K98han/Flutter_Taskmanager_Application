import 'dart:convert';
import 'package:http/browser_client.dart' as http;
import 'package:http/http.dart';

class NetworkUtils {
  Future<dynamic> getMethod(String url) async {
    try {
      final Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print('Unauthorized');
      } else {
        print('Something went worong');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postMethod(String url, {Map<String, String>? body}) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print('Unauthorized');
      } else {
        print('Something went worong');
      }
    } catch (e) {
      print(e);
    }
  }
}
