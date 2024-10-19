import 'dart:convert';
import 'package:flutter_mautic/mautic_base_service.dart';
import 'package:http/http.dart' as http;

class TrackingService extends MauticBaseService {
  // Track an event for a specific contact
  Future<http.Response> trackEvent(String contactId, Map<String, dynamic> eventData) async {
    final url = '${mauticBaseUrl!}/api/contacts/$contactId/events/new';
    final headers = getHeaders();

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(eventData),
    );
    return response;
  }
}
