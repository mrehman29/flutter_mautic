import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class MauticBaseService {
  String? mauticBaseUrl;
  String? username;
  String? password;
  late http.Client httpClient;

  MauticBaseService();

  void initialize(String mauticBaseUrl, String username, String password) {
    this.mauticBaseUrl = mauticBaseUrl;
    this.username = username;
    this.password = password;
    httpClient = http.Client();
  }

  // Generates basic authentication header
  String _getBasicAuthHeader() {
    final credentials = base64Encode(utf8.encode('$username:$password'));
    return 'Basic $credentials';
  }

  // Returns default headers for requests
  Map<String, String> getHeaders() {
    return {
      'Authorization': _getBasicAuthHeader(),
      'Content-Type': 'application/json',
    };
  }
}