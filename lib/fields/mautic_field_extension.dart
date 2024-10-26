enum FieldType {
  text,
  number,
  boolean,
  datetime,
  email,
  tel,
  url,
  region,
  country,
  locale,
  timezone,
}

enum PubliclyUpdatable { yes, no }

enum RequiredField { required, notRequired }

extension FieldTypeExtension on FieldType {
  // Convert enum to string compatible with Mautic API
  String get typeString {
    switch (this) {
      case FieldType.text:
        return 'text';
      case FieldType.number:
        return 'number';
      case FieldType.boolean:
        return 'boolean';
      case FieldType.datetime:
        return 'datetime';
      case FieldType.email:
        return 'email';
      case FieldType.tel:
        return 'tel';
      case FieldType.url:
        return 'url';
      case FieldType.region:
        return 'region';
      case FieldType.country:
        return 'country';
      case FieldType.locale:
        return 'locale';
      case FieldType.timezone:
        return 'timezone';
    }
  }
}

extension PubliclyUpdatableExtension on PubliclyUpdatable {
  int get value {
    switch (this) {
      case PubliclyUpdatable.yes:
        return 1;
      case PubliclyUpdatable.no:
        return 0;
    }
  }
}

extension RequiredFieldExtension on RequiredField {
  int get value {
    switch (this) {
      case RequiredField.required:
        return 1;
      case RequiredField.notRequired:
        return 0;
    }
  }
}
