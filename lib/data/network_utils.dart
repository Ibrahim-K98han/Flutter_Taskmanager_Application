import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'dart:developer';
import 'package:taskmanager/main.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';

class NetworkUtils {
  Future<dynamic> getMethod(
    String url, {
    VoidCallback? onUnAuthorize,
  }) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtils.token ?? ''
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went wrong ');
      }
    } catch (e) {
      log(
        'Error $e',
      );
    }
  }

  Future<dynamic> postMethod(
    String url, {
    Map<String, String>? body,
    VoidCallback? onUnAuthorize,
  }) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtils.token ?? ''
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went worong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  void moveToLogin() async {
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        TaskManager.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
