import 'package:url_launcher/url_launcher.dart';

class LocationSearch {
  static Future<void> openLocation(String location) async {
    final Uri uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}',
    );

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      throw 'Could not launch Google Maps';
    }
  }
}
