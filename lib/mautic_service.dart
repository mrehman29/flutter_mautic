import 'package:logging/logging.dart';
import 'package:flutter_mautic/contact/mautic_contact_service.dart';
import 'package:flutter_mautic/tracking/mautic_tracking_service.dart';

class MauticService {
  late ContactService contactService;
  late TrackingService trackingService;

  static final MauticService _instance = MauticService._internal();

  bool _isInitialized = false;

  // Create a logger instance for MauticService
  final Logger _logger = Logger('MauticService');

  // Private constructor for singleton pattern
  MauticService._internal();

  // Factory constructor to return the same instance
  factory MauticService() {
    return _instance;
  }

  // Method to initialize the service
  void initialize({
    required String mauticBaseUrl,
    required String username,
    required String password,
  }) {
    if (_isInitialized) {
      _logger.warning('MauticService is already initialized.');
      return;
    }

    contactService = ContactService();
    contactService.initialize(mauticBaseUrl, username, password);

    trackingService = TrackingService();
    trackingService.initialize(mauticBaseUrl, username, password);

    _isInitialized = true;
    _logger.info('MauticService has been initialized.');
  }

  // Check if service is initialized
  bool get isInitialized => _isInitialized;
}
