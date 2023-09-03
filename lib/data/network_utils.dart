import 'dart:convert';
import 'package:http/browser_client.dart' as http;
import 'package:http/http.dart';

class NetworkUtils {
  Future<dynamic> getMethod(String url) async {
    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else {
      print('Something went worong');
    }
  }
}
