import 'dart:convert';
import 'package:flutter_mautic/mautic_base_service.dart';
import 'package:http/http.dart' as http;

class CampaignService extends MauticBaseService {
  // Add Specific Contact to campaign
  Future<http.Response> addToCampaign(String campaignId, String contactId) async {
    final url = '${mauticBaseUrl!}/api/campaigns/$campaignId/contact/$contactId/add';
    final headers = getHeaders();

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add user to campaign: ${response.statusCode}');
    }

    return jsonDecode(response.body);
  }

  // Remove Specific Contact from campaign
  Future<http.Response> removeFromCampaign(String campaignId, String contactId) async {
    final url = '${mauticBaseUrl!}/api/campaigns/$campaignId/contact/$contactId/remove';
    final headers = getHeaders();

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to remove user from campaign: ${response.statusCode}');
    }

    return jsonDecode(response.body);
  }
}
