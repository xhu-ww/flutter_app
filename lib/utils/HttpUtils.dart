import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtils {
  static final String host = "http://route.showapi.com";
  static final String showApiAppId = "42684";
  static final String showApiAppKey = "f6527e909abc4edea350ec8b9a9db0f5";

  static final String url =
      "http://route.showapi.com/1164-2?showapi_appid=42684&showapi_sign=f6527e909abc4edea350ec8b9a9db0f5";

  Future<http.Response> get(String ur) {
    return http.get(ur);
  }

  static void post() {}
}
