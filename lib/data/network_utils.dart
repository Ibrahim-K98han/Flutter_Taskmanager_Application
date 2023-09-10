import 'dart:convert';
import 'package:flutter/material.dart';
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
        print('Something went wrong ');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onUnAuthorize,
      String? token}) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'token': token ?? ''},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
      } else {
        print('Something went worong ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
