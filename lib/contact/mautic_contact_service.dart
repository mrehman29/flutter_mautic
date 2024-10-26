import 'dart:convert';
import 'package:flutter_mautic/mautic_base_service.dart';
import 'package:http/http.dart' as http;

class ContactService extends MauticBaseService {
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

  // Get specific contact details by ID
  Future<Map<String, dynamic>> getContactById(String contactId) async {
    final url = '$mauticBaseUrl/api/contacts/$contactId';
    final headers = getHeaders();

    final response = await httpClient.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Decode the response body into a map and return
      return jsonDecode(response.body)['contact'];
    } else {
      // Throw an exception or return an empty map in case of error
      throw Exception('Failed to load contact: ${response.statusCode}');
    }
  }

  // Function to delete a contact by ID
  Future<void> deleteContact(String contactId) async {
    final url = '$mauticBaseUrl/api/contacts/$contactId/delete';
    final headers = getHeaders();

    final response = await httpClient.delete(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete contact: ${response.statusCode}');
    }
  }

  // Function to update a specific contact by adding custom fields
  Future<void> updateContact(String contactId, Map<String, dynamic> contactData) async {
    final url = '$mauticBaseUrl/api/contacts/$contactId/edit';
    final headers = getHeaders();

    // Send the update request to Mautic
    final response = await httpClient.patch(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(contactData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update contact: ${response.statusCode}');
    }
  }
}
