import 'dart:convert';
import 'package:flutter_mautic/fields/mautic_field_extension.dart';
import 'package:flutter_mautic/mautic_base_service.dart';

class FieldsService extends MauticBaseService {
  Future<Map<String, dynamic>> getCurrentFields() async {
    Map<String, dynamic> fields = currentFields();
    if (fields.isEmpty) {
      final url = '$mauticBaseUrl/api/fields/contact';

      final headers = getHeaders();

      final response = await httpClient.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        fields = jsonDecode(response.body)['fields'] as Map<String, dynamic>;
        setCurrentFields(fields);
      } else {
        throw Exception('Failed to retrieve contact fields: ${response.statusCode}');
      }
    }

    return fields;
  }

  Future<bool> doesFieldExist(String fieldAlias) async {
    final fields = await getCurrentFields();

    // Loop through fields to find if any field has the alias matching fieldAlias
    for (var field in fields.values) {
      if (field['alias'] == fieldAlias) {
        return true; // Field with the specified alias exists
      }
    }
    return false; // No field with the specified alias found
  }

  // Function to create a new custom field with enum values
  Future<void> createCustomField(
    String fieldName,
    String label,
    FieldType fieldType, {
    PubliclyUpdatable isPubliclyUpdatable = PubliclyUpdatable.no,
    RequiredField isRequired = RequiredField.notRequired,
  }) async {
    final url = '$mauticBaseUrl/api/fields/contact/new';
    final headers = getHeaders();

    final fieldData = {
      'label': label,
      'alias': fieldName,
      'type': fieldType,
      'is_publicly_updatable': isPubliclyUpdatable.value,
      'is_required': isRequired.value,
    };

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(fieldData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create custom field: ${response.statusCode}');
    }
  }
}
