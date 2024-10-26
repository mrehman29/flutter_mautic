import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class MauticBaseService {
  String? mauticBaseUrl;
  String? username;
  String? password;
  late http.Client httpClient;

  Map<String, dynamic> _currentFields = {};

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

  // Set or update current fields from Mautic
  void setCurrentFields(Map<String, dynamic> currentFields) {
    _currentFields = currentFields;
  }

  // Return current fields
  Map<String, dynamic> currentFields() {
    return _currentFields;
  }
}
