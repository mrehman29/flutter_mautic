# Flutter Mautic

Flutter Mautic provides a convenient wrapper around the Mautic API for Flutter applications, enabling easy management of contacts, campaigns, and custom fields. With this package, you can integrate Mautic's powerful CRM capabilities into your Flutter app to enhance your customer engagement.

## Features

- **Contact Management**: Retrieve and delete contacts within your app.
- **Campaign Management**: Add or remove contacts from Mautic campaigns.
- **Field Management**: Access and manage Mautic custom fields.
- **Authorization**: Secures API requests with Basic Authentication.
- **Singleton Pattern**: Access Mautic services through a singleton instance for easy initialization.

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_mautic: ^0.0.1
```

Run `flutter pub get` to install the package.

## Usage

### Initialization

To begin, initialize `MauticService` with your Mautic instance's credentials:

```dart
import 'package:flutter_mautic/mautic_service.dart';

void main() {
  final mauticService = MauticService();
  mauticService.initialize(
    mauticBaseUrl: 'https://your-mautic-instance.com',
    username: 'your-username',
    password: 'your-password',
  );
}
```

### Contact Service

Manage Mautic contacts easily:

```dart
final contactService = mauticService.contactService;

// Get contact by ID
contactService.getContactById('123').then((contact) {
  print('Contact Info: $contact');
});

// Delete a contact by ID
contactService.deleteContact('123').then((_) {
  print('Contact deleted successfully.');
});
```

### Campaign Service

Add or remove contacts from campaigns:

```dart
final campaignService = mauticService.campaignService;

// Add contact to campaign
campaignService.addToCampaign('campaignId', 'contactId');

// Remove contact from campaign
campaignService.removeFromCampaign('campaignId', 'contactId');
```

### Fields Service

Retrieve and manage custom fields in Mautic:

```dart
final fieldsService = mauticService.fieldsService;

// Retrieve all contact fields
fieldsService.getCurrentFields().then((fields) {
  print('Contact Fields: $fields');
});

// Check if a field exists
fieldsService.doesFieldExist('fieldAlias').then((exists) {
  print('Field exists: $exists');
});
```

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please create an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
