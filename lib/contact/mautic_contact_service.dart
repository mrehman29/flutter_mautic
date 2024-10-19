import 'dart:convert';
import 'package:flutter_mautic/mautic_base_service.dart';
import 'package:http/http.dart' as http;

class ContactService extends MauticBaseService {
  // Create or update a contact
  Future<http.Response> createOrUpdateContact(Map<String, dynamic> contactData) async {
    final url = '${mauticBaseUrl!}/api/contacts/new';
    final headers = getHeaders();

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(contactData),
    );
    return response;
  }

  // Register an anonymous contact
  Future<http.Response> registerAnonymousContact() async {
    final url = '${mauticBaseUrl!}/api/contacts/new';
    final headers = getHeaders();

    final anonymousContactData = {
      'ipAddress': 'auto', // Mautic will assign the IP automatically
    };

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(anonymousContactData),
    );
    return response;
  }
}
